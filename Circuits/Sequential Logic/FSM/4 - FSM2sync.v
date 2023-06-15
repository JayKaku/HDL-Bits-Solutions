module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  


    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset) begin
           out <= 0; 
        end
        else begin
           case({j,k})
            2'b00: out <= out;
            2'b01: out <= 0;
            2'b10: out <= 1;
            2'b11: out <= ~out;
           endcase 
        end
    end

endmodule