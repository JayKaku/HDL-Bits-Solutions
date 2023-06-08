module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    
    wire[3:0] one, ten, hundred;
    
    assign c_enable = {one == 4'd9 & ten == 4'd9, one == 4'd9, 1'b1};
    assign OneHertz = {one == 4'd9 & ten == 4'd9 & hundred == 4'd9};

    bcdcount counter0 (clk, reset, c_enable[0], one);
    bcdcount counter1 (clk, reset, c_enable[1], ten);
    bcdcount counter2 (clk, reset, c_enable[2], hundred);

endmodule