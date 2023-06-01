module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
    always @(posedge clk) begin
        Q <= L==1'b1 ? R : (E==1'b1 ? w : Q );  
    end

endmodule
