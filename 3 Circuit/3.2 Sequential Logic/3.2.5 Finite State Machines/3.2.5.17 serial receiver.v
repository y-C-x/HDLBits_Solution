module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter i=0, r=1, d=2, e=3;
    reg[1:0] state, next;
    int cnt;
    
    always @(*) begin
        case(state)
            i: next = (~in)? r: i;
            r: next = (cnt == 9 && in)? d : (cnt==9 && ~in)? e : r; // 9 for end bit
            d: next = (~in)? r: i;
            e: next = (in)? i : e;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= i;
            cnt = 0; // 0 for start bit
        end
        else begin
            state <= next;
            if (next == r)
                cnt = cnt + 1;
            if (next == e || next == d)
                cnt = 0;
        end        
    end
    
    assign done = (state == d);

endmodule
