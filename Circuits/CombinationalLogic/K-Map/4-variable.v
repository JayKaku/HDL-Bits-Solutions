// using SOP (standard method)
// https://youtu.be/-EGwpKLvp1A

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    
    assign out = ~c&a&~b | d&a&~b | c&d&a | c&d&b | c&~a&b | c&~d&~a | ~c&~a&~b | ~c&~d&~a;

endmodule

// using POS
// Reference: https://youtu.be/_y1X1u7N2C4

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    
    assign out = (!c|!d|a|b) & (c|!d|!b) & (c|!a|!b) & (!c|d|!a);

endmodule
