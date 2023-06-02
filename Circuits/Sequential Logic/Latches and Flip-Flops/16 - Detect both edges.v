module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] inter;
    
    always @(posedge clk) begin
    	inter <= in;
        // A -> prev state , B -> curr state
        // A'B (to detect 0 -> 1 tansition i.e. posedge)
        // AB' (to detect 1 -> 0 tansition i.e. negedge)
        // for both A'B + AB' = A xor B = A ^ B
        anyedge <= inter ^ in;
    end


endmodule
