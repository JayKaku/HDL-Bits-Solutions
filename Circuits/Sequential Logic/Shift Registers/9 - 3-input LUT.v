module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z );
    
    reg [0:7] Q;
    genvar i;
    
    always @(posedge clk) begin
        if(enable) begin
            Q <= {S, Q[0:6]};
        end
    end
    
    always @(A,B,C) begin
        case({A,B,C})
            3'd0: Z = Q[0];
            3'd1: Z = Q[1];
            3'd2: Z = Q[2];
            3'd3: Z = Q[3];
            3'd4: Z = Q[4];
            3'd5: Z = Q[5];
            3'd6: Z = Q[6];
            3'd7: Z = Q[7];
        endcase 
    end

endmodule
