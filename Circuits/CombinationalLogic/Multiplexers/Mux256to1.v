module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output [3:0] out ); 
    
    always @ (*) begin
        out  = in[sel];     
    end
endmodule