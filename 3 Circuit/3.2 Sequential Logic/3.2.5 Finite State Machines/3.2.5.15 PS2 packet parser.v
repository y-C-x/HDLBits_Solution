module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
	
    parameter init=0, read=1, d = 2;
    reg[1:0] state, next;
    int cnt;
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            init: next = (in[3])? read : init;
            read: next = (cnt == 3)? d : read;
            d: next = (in[3])? read : init;
        endcase
    end

    // State flip-flops (sequential)
    always@ (posedge clk) begin
        if (reset) begin
            state <= init;
        	cnt = 1;
        end
        else begin
            state <= next;
            if (next == read)
                cnt = cnt + 1;
            if (next == d)
                cnt = 1;
        end
    end
        
    
    // Output logic
    assign done = (state == d);

endmodule
