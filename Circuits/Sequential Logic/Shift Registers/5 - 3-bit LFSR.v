module sub(
	input clk,load,in_0,in_1,
    output q
);
    wire out;
    always @ * begin
        case(load)
            1'b0: out = in_0;
            1'b1: out = in_1;
            default: out = 0;
        endcase
    end
    
    
    always @(posedge clk) begin
        
        q <= out;
    end
    
endmodule


module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    sub sub0(KEY[0], KEY[1], LEDR[2], SW[0], LEDR[0]);
    sub sub1(KEY[0], KEY[1], LEDR[0], SW[1], LEDR[1]);
    sub sub2(KEY[0], KEY[1], LEDR[2]^LEDR[1], SW[2], LEDR[2]);
    
endmodule
