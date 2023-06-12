module time_9(
    input clk,
    input reset,
    input enable,
    output [3:0] tt
);
    
    always @(posedge clk) begin
        if(reset) begin
            tt <= 0;
        end
        else begin
            if(enable) begin
                if(tt == 4'd9) begin
                   tt <= 4'b0;
                end
                else begin
                    tt <= tt + 1'b1; 
                end  
            end
        end
        
    end

endmodule

module time_5(
    input clk,
    input reset,
    input enable,
    output [3:0] tt
);
    
    always @(posedge clk) begin
        if(reset) begin
            tt <= 0;
        end
        else begin
            if(enable) begin
                if(tt == 4'd5) begin
                   tt <= 4'b0;
                end
                else begin
                    tt <= tt + 1'b1; 
                end  
            end
        end
        
    end

endmodule


module time_hh (
	input clk, reset, enable,
    output [7:0] tt
);
     always @(posedge clk) begin
        if(reset) begin
            // reset to 12:00:00 AM
            tt[3:0] <= 2;
            tt[7:4] <= 1;
        end
        else begin
            if(enable) begin
                if(tt[3:0] == 4'd2 && tt[7:4] == 4'd1) begin
                    tt <= 8'b1;
                end
                else if(tt == 4'd9) begin
                    tt[3:0] <= 4'b0;
                    tt[7:4] <= 4'b1;
                end
                else begin
                    tt[3:0] <= tt[3:0] + 1'b1; 
                end  
            end
        end
        
    end

endmodule



module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    reg pm_temp;
    
    wire [1:0] en_ss, en_mm; 
    wire en_hh;
    
    assign en_ss = { (ss[3:0] == 4'd9), 1'b1};
    assign en_mm = { (mm[3:0] == 4'd9) & (ss[7:4] == 4'd5) & (ss[3:0] == 4'd9), (ss[7:4] == 4'd5) & (ss[3:0] == 4'd9)};
    assign en_hh = (mm[7:4] == 4'd5) & (mm[3:0] == 4'd9) & (ss[7:4] == 4'd5) & (ss[3:0] == 4'd9);
    
    
    always @(posedge clk) begin
       
        if(reset) begin 
            pm_temp <= 0;
        end
        else if (((hh[7:4] == 4'd1) & (hh[3:0] == 4'd1) & (mm[7:4] == 4'd5) & (mm[3:0] == 4'd9) & (ss[7:4] == 4'd5) & (ss[3:0] == 4'd9))) begin
            pm_temp <= ~pm_temp;
        end
        
    end
    
    assign pm = pm_temp;
    
    
    time_9 s0(clk, reset, ena & en_ss[0], ss[3:0]);
    time_5 s1(clk, reset, ena & en_ss[1], ss[7:4]);
    
    time_9 m0(clk, reset, ena & en_mm[0], mm[3:0]);
    time_5 m1(clk, reset, ena & en_mm[1], mm[7:4]);
    
    time_hh h0(clk, reset, ena & en_hh, hh);

endmodule
