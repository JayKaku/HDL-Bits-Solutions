module top_module (
    input clk,
    input x,
    output z
); 
    reg x0= 0,x1= 0,x2 = 0;
    
    always @(posedge clk) begin
        x0 <= x ^ x0;
        x1 <= ~x1 & x;
        x2 <= ~x2 | x;
    end
    
    assign z = ~(x0 | x1 | x2 );

endmodule
