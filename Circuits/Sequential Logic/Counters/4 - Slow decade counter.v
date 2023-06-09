module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
       
        if(reset == 1'b1) begin
           q <= 0; 
        end
        else if (slowena == 1'b1) begin
            if(q == 4'b1001) begin 
             	q <= 0;
        	end
            else begin
           		q <= q + 1;
            end
        end
        else begin
            q <= q;
        end
        
    end

endmodule
