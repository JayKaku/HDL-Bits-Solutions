module FA(
	input a,b,cin,
    output cout,sum
);
    
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin;
    
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    wire [99:0] wcout;
    
    FA add0(a[0], b[0],cin,wcout[0],sum[0]);
    FA add99(a[99], b[99],wcout[98],cout,sum[99]);
    
    
    genvar i;
    generate
        for(i = 1; i < 99; i+=1) begin: full_adder
            FA add1(a[i], b[i], wcout[i-1], wcout[i], sum[i]);
        end
    endgenerate

endmodule