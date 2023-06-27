module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter S1 = 2'd0, S2 = 2'd1, S3 = 2'd2, DONE = 2'd3;
    reg [1:0] state, next_state = 'x;
    
    reg [23:0] temp;
    // State transition logic (combinational)
    always @(*) begin
        case(state) 
            S1: begin
                next_state = in[3] ? S2: S1;
				temp[23:16] = in;
            end
            S2:begin
                next_state = S3;
                temp[15:8] = in;
            end
            S3: begin
               next_state = DONE;
               temp[7:0] = in;
            end
            DONE: begin
               next_state = in[3] ? S2: S1;
               temp[23:16] = in;
            end
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) begin
            state <= S1;
        end
        else begin
           state <= next_state; 
           out_bytes <= temp;
        end
        
    end
 
    // Output logic
    assign done = (state == DONE);

    // New: Datapath to store incoming bytes.
    

endmodule
