module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    parameter IDLE = 4'd0, START = 4'd1, S1= 4'd3, S2= 4'd4, S3= 4'd5, S4= 4'd6,
 S5 = 4'd7, S6 = 4'd8, S7= 4'd9, S8= 4'd10, ERR = 4'd11, STOP = 4'd12;
    
    reg [3:0] state , next_state;
    
    // state transition logic
    
    always @(*) begin
        case(state)
            IDLE: next_state = in ? IDLE : START;
            START: next_state =  S1;
            S1: next_state =  S2;
            S2: next_state =  S3;
            S3: next_state =  S4;
            S4: next_state =  S5;
            S5: next_state =  S6;
            S6: next_state =  S7;
            S7: next_state =  S8;
            S8: next_state = in ? STOP : ERR;
            STOP: next_state =  in ? IDLE: START;
            ERR: next_state = in ? IDLE : ERR;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end
    
    assign done = (state == STOP);        
            
endmodule
