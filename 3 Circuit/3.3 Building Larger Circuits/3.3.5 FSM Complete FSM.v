module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter S=0,S1=1,S11=2,S110=3, B0=4, B1=5, B2=6, B3=7, cnt=8, hold=9;
    reg[3:0] state, next;
    
    always@ (*) begin
        case(state)
            S: next = (data)? S1 : S;
            S1: next = (data)? S11: S;
            S11: next = (~data)? S110:S11;
            S110: next = (data)? B0 : S;
            B0: next = B1;
            B1: next = B2;
            B2: next = B3;
            B3: next = cnt;
            cnt: next = (done_counting)? hold:cnt;
            hold: next = (ack)? S:hold;
        endcase
    end

    always@(posedge clk) begin
        if (reset)
            state <= S;
        else
            state <= next;
    end
    
    assign shift_ena = (state == B0) || (state == B1) || (state == B2) || (state == B3); 
    assign counting = (state == cnt);
    assign done = (state == hold);
    
    
endmodule
