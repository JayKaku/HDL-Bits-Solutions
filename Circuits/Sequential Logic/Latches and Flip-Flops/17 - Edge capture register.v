module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] inter;
    
    always @(posedge clk) begin
        inter <= in;
        if(reset) begin
           out <= 'b0; 
        end 
        else begin 		
           	out <= out | (inter & ~in); 
        end

        
    end

endmodule
