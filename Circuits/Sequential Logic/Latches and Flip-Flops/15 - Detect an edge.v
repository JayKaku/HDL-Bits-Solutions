module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg [7:0]inter;
    
    always @ (posedge clk) begin
        inter <= in;
        pedge <= (~inter) & in;
    end

endmodule