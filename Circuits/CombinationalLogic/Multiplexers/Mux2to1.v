module top_module( 
    input a, b, sel,
    output out );
    
    always @(*) begin
        case(sel)
            1'b0: out = a;
            1'b1: out = b;
            default: out = 0;
        endcase
    end

endmodule
