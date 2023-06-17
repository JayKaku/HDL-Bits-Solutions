module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT = 2'b0, FL = 2'd1, RIGHT = 2'd2, FR = 2'd3;
    reg [1:0] state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT: next_state = ground ? (bump_left ? RIGHT : LEFT) : FL;
            RIGHT: next_state = ground ? (bump_right ? LEFT : RIGHT) : FR;
            FL: next_state = ground ? LEFT : FL;
            FR: next_state = ground ? RIGHT : FR;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)begin
           state <= LEFT;
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic
    assign walk_left = state == LEFT;
    assign walk_right = state == RIGHT;
    assign aaah = (state == FL) | (state == FR);

endmodule
