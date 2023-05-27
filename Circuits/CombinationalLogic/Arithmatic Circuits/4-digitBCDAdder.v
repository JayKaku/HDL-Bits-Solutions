module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [3:0] wcout;
    
    bcd_fadd add0(a[0*4+:4], b[0*4+:4], cin, wcout[0],sum[0*4+:4]);
    bcd_fadd add1(a[1*4+:4], b[1*4+:4], wcout[0], wcout[1],sum[1*4+:4]);
    bcd_fadd add2(a[2*4+:4], b[2*4+:4], wcout[1], wcout[2],sum[2*4+:4]);
    bcd_fadd add3(a[3*4+:4], b[3*4+:4], wcout[2], cout,sum[3*4+:4]);
    

endmodule
