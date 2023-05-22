module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    reg [1:0] cnt;
    integer i;

    always @(in)begin

        // needs to be initialized to 0
        // else the prev value will be reatined
        // and for that `cnt` would endup being a reg post synthesis
        cnt = 0; 
        
        for(i=0;i<3;i+=1)begin
            if(in[i] == 1'b1)begin
                cnt += 1'b1;
            end
    	end 
       out = cnt; 
    end

endmodule
