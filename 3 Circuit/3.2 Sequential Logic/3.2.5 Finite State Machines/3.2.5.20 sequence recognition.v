module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter i=0, one=1, two=2, thr=3, four=4, fiv=5, six=6, er=7, ds=8, flg=9;
    reg[3:0] state, next;
    
    always@(*) begin
        case(state)
            i: next = (in)? one:i;
            one: next = (in)? two:i;
            two: next = (in)? thr:i;
            thr: next = (in)? four:i;
            four: next = (in)? fiv:i;
            fiv: next = (in)? six:ds;
            six: next = (in)? er:flg;
            er: next = (in)? er:i;
            ds: next = (in)? one:i;
            flg: next = (in)? one:i;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= i;
        else 
            state <= next;
    end
    
    assign disc = (state == ds);
    assign flag = (state == flg);
    assign err = (state == er);
    
    

endmodule
