module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    parameter S=0,S1=1,S11=2,S110=3, B0=4, B1=5, B2=6, B3=7, cnt=8, delay_cnt=9, last_cnt=10, hold=11;
    reg[3:0] state, next, delay;
    reg[9:0] thousand;
    reg[3:0] counter;

    always@ (*) begin
        case(state)
            S: next = (data)? S1 : S;
            S1: next = (data)? S11: S;
            S11: next = (~data)? S110:S11;
            S110: next = (data)? B0 : S;
            B0: begin next = B1;
                delay[3] = data;
            end
            B1: begin next = B2;
                delay[2] = data;
            end
            B2: begin next = B3;
                delay[1] = data;
            end
            B3: begin next = cnt;
                delay[0] = data;
            end
            cnt: next = (delay == 4'd0)? last_cnt : (thousand == 10'd998)? delay_cnt : cnt;
            delay_cnt: next = (counter == 4'd1)? last_cnt : cnt; // one clock count
            last_cnt: next = (thousand == 10'd999)? hold:last_cnt;
            hold: next = (ack)? S:hold;
        endcase
    end
    
    always@ (posedge clk) begin
        if (state == B3) begin
            counter <= {delay[3:1],data};
        	thousand <= 0;
        end
        if (state == cnt || state == last_cnt) 
            thousand <= thousand + 1'b1;
        if (state == delay_cnt) begin
            thousand <= 0;
            counter <= counter - 1'b1;
        end
    end
    

    always@(posedge clk) begin
        if (reset)
            state <= S;
        else begin
            state <= next;
        end 
    end

    assign counting = (state == cnt) || (state == delay_cnt) || (state == last_cnt);
    assign done = (state == hold);
    assign count = counter;

endmodule
