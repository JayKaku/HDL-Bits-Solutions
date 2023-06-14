module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  


    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
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
