module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    
    parameter LEFT = 3'b0, FL = 3'd1, DigL = 3'd2, RIGHT = 3'd3, FR = 3'd4, DigR = 3'd5, SPLAT = 3'd6;
    reg [2:0] state, next_state;
    int splat_cntr;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT: begin
                casez({ground,dig})
                    2'b0z: next_state = FL;
                    2'b10: next_state = bump_left ? RIGHT : LEFT;
                    2'b11: next_state = DigL;
                endcase
            end
            RIGHT: begin
                casez({ground,dig})
                    2'b0z: next_state = FR;
                    2'b10: next_state = bump_right ? LEFT : RIGHT;
                    2'b11: next_state = DigR;
                endcase
            end
            // here the logic is when landing on ground is the splat_ctr > 19
            FL: next_state = ground ? (splat_cntr > 19 ? SPLAT : LEFT ) :  FL;
                // `older (wrong) logic` we are trying to kill the Lemming mid air (coz ground == 0 & ctr > 19) 
                //next_state = ground ? LEFT : (splat_cntr > 19 ? SPLAT : FL );
            FR: next_state = ground ? (splat_cntr > 19 ? SPLAT : RIGHT ) :  FR;
            DigL: next_state = ground ? DigL: FL;
            DigR: next_state = ground ? DigR: FR;
            SPLAT: next_state = SPLAT;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)begin
           state <= LEFT;
        end
        else if (state == FL || state == FR) begin
            splat_cntr <= splat_cntr + 1; 
            state <= next_state;
        end
        else begin
            state <= next_state;
            splat_cntr <= 0;
        end
    end

    // Output logic
    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;
    assign aaah = (state == FL) || (state == FR);
    assign digging = (state == DigL) || (state == DigR);

endmodule