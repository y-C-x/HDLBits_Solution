module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter a=0, b=1;
    reg state, next;
    
    always@(*) begin
        case(state)
            a: next = (s)? b : a;
            b: next = b;
        endcase
    end
    
    always@(posedge clk) begin
        if (reset)
            state <= a;
        else
            state <= next;
    end
    
    int clk_cnt;
    reg[1:0] cnt; 
    
    always@(posedge clk) begin
        if (reset || state == a) begin
            clk_cnt = 0;
            cnt = 0;
        end
        
        else begin
            if (state == b) begin 
                if (clk_cnt < 3)
                	clk_cnt = clk_cnt + 1;
                else begin // clk_cnt = 3, reset cnt first
                    clk_cnt = 1;
                    cnt = 0;
                end
            end
            if(next == b) begin
                cnt = cnt + w;
            end 
        end
    end
        
    assign z = (cnt == 2'd2) && (clk_cnt == 3);
        
endmodule
