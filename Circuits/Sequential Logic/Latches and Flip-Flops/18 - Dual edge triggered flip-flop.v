module top_module (
    input clk,
    input d,
    output q
);
    
    reg [1:0] status;
    // capture at pos edge
    always @(posedge clk) begin
        status[0] <= d;
    end
    // capture at neg edge
    always @(negedge clk) begin
        status[1] <= d; 
    end
    
    // when clk = 1 show neg edge status and vice versa
    assign q = (clk) ? status[0] : status[1];

endmodule
