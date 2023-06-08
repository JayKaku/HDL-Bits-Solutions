module decade_cntr (
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [3:0] z);
    
    always @(posedge clk) begin
        if(reset == 1'b1) begin
           z <= 0;
        end
        else begin
            if(enable) begin
                if(z == 4'b1001) begin 
                    z <= 0;
                end
                else begin
                   z <= z + 1; 
                end 
            end
        end
          
    end

endmodule


module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena = { (q[11:0] == 'h999), (q[7:0] == 'h99), (q[3:0] == 'h9)};
    

    decade_cntr dc0(clk, reset, 	 1, q[3:0]);
    decade_cntr dc1(clk, reset, ena[1], q[7:4]);
    decade_cntr dc2(clk, reset, ena[2], q[11:8]);
    decade_cntr dc3(clk, reset, ena[3], q[15:12]);
    

endmodule