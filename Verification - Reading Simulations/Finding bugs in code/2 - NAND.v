module top_module (input a, input b, input c, output out);//
	
    wire w1;
    
    andgate inst1 ( w1, a, b, c, c, c );
    
    assign out = ~w1;

endmodule