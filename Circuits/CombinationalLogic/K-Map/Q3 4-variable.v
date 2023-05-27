// SOP

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    
    assign out =  (!c&!d&a) | (c&a) | (c&!b);

endmodule


// POS
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    
    assign out = (!c|!b|a) & (!d|!b|a) & (c|!d|a) & (c|b|a);

endmodule