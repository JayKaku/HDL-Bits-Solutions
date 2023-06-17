module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    // State
    parameter D = 2'd0, C = 2'd1, B = 2'd2, A = 2'd3;
    reg [1:0] current_state, next_state;
    
    
    always @(posedge clk) begin
        if(reset) begin
           current_state <= D;
        end
        else begin
            current_state <= next_state;
        end
        
    end
    
    // state transition logic
    always @(*) begin
        case(current_state)
            A: begin
                case(s)
                    3'd7: next_state = A;
                    3'd3: next_state = B;
                    3'd1: next_state = C;
                    3'd0: next_state = D;
                    default: next_state = 'x;
                endcase
            end
            B: begin
                case(s)
                    3'd7: next_state = A;
                    3'd3: next_state = B;
                    3'd1: next_state = C;
                    3'd0: next_state = D;
                    default: next_state = 'x;
                endcase
            end
            C: begin
                case(s)
                    3'd7: next_state = A;
                    3'd3: next_state = B;
                    3'd1: next_state = C;
                    3'd0: next_state = D;
                    default: next_state = 'x;
                endcase
            end
            D: begin
                case(s)
                    3'd7: next_state = A;
                    3'd3: next_state = B;
                    3'd1: next_state = C;
                    3'd0: next_state = D;
                    default: next_state = 'x;
                endcase
            end
        endcase
        
    end

    reg [3:1] prev_fr;
    always@(posedge clk) begin
        prev_fr <= {fr3,fr2,fr1};
    end
    
    always @(*) begin 
        case(current_state)
            A: {fr3,fr2,fr1} = 3'b0;
            B: {fr3,fr2,fr1} = 3'd1;
            C: {fr3,fr2,fr1} = 3'd3;
            D: {fr3,fr2,fr1} = 3'd7;
            default: {fr3,fr2,fr1} = 'x;
         endcase
    end

    always @(*) begin
        if(~fr3 & prev_fr[3] | ~fr2 & prev_fr[2] | ~fr1 & prev_fr[1]) begin
           dfr = 1'b0; 
        end
        else if (fr3 & ~prev_fr[3] | fr2 & ~prev_fr[2] | fr1 & ~prev_fr[1]) begin
            dfr = 1'b1;
        end
    end
    
endmodule