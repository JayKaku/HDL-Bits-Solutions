module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = ~(a^b^c^d); // Fix me

endmodule
// made truth table and then K-Map