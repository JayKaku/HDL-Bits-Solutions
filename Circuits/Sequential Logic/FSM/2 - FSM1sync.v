// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 1'b0;
    parameter B = 1'b1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
        end else begin
            present_state <= next_state;
        end
    end
    
    
    always @(*) begin
        // Transition logic
        case(present_state)
            B: next_state = in == 1'b1 ? B : A;
            A: next_state = in == 1'b1 ? A : B;
        endcase
        
        case(present_state)
            A: out = 1'b0;
            B: out = 1'b1;
        endcase
    end

endmodule
