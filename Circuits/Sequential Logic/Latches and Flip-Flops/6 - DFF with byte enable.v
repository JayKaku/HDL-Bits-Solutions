module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    
    always @(posedge clk) begin
        if(resetn == 1'b0) begin
            case (byteena)
                2'b10: q[15:8] <= 'b0;
                2'b01: q[7:0] <= 'b0;
                2'b11: q <= 'b0;
                2'b00:q <= q;
    		endcase
        end
        else begin
            case (byteena)
                2'b10: q[15:8] <= d[15:8];
                2'b01: q[7:0] <= d[7:0];
                2'b11: q <= d;
                2'b00:q <= q;
    		endcase
        end
        
    end

endmodule
