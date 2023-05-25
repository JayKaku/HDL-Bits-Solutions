module FA(
	input a,b,cin,
    output cout,sum
);
    
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin;
    
endmodule


module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire cout0,cout1,cout2;
    
    FA add0(x[0],y[0],0,cout0,sum[0]);
    FA add1(x[1],y[1],cout0,cout1,sum[1]);
    FA add2(x[2],y[2],cout1,cout2,sum[2]);
    FA add3(x[3],y[3],cout2,sum[4],sum[3]);

endmodule
