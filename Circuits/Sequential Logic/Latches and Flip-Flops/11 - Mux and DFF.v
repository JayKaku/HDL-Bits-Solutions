module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @(posedge clk) begin 
        if(L == 1'b1) begin 
           Q <= r_in; 
        end
        else begin
           Q <= q_in; 
        end
    end

endmodule
