module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter S1 = 2'd0, S2 = 2'd1, S3 = 2'd2, DONE = 2'd3;
    reg [1:0] state, next_state;
    // State transition logic (combinational)
    always @(*) begin
        case(state) 
            S1: next_state = in[3] ? S2: S1;
            S2: next_state = S3;
            S3: next_state = DONE;
            DONE: next_state = in[3] ? S2: S1;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) begin
            state <= S1;
        end
        else begin
           state <= next_state; 
        end
        
    end
 
    // Output logic
    assign done = (state == DONE);

endmodule
