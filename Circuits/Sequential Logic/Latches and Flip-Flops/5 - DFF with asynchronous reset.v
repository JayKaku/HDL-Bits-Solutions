module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    always @(posedge clk, posedge areset) begin
       
        if(areset == 1'b1)begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end

endmodule
