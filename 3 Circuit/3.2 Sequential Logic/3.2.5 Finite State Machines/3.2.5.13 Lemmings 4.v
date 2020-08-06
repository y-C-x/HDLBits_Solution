module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter L=0,R=1,LF=2,RF=3, LD=4, RD =5, SP = 6;
    reg [2:0] state, next_state;
    int second;
    
    always @(*) begin
        case(state)
            L: next_state = (~ground)? LF : (dig)? LD : (bump_left)? R : L;
            R: next_state = (~ground)? RF : (dig)? RD : (bump_right)? L : R;
            LF: next_state = (~ground)? LF : (second > 19)? SP : L;
            RF: next_state = (~ground)? RF : (second > 19)? SP : R;
            LD: next_state = (ground)? LD : LF;
            RD: next_state = (ground)? RD : RF;
            SP: next_state = SP;
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if(areset) begin
            state <= L;
            second = 0;
        end
        else begin
            state <= next_state;
            if ((state == LF) || (state == RF))
                second = second + 1;
            else if (second > 20)
                second  = 20;
            else
                second = 0; // have to reset counter 
        end
    end
    
    assign aaah = ((state == LF) || (state == RF)) ;
    assign walk_left = (state == L);
    assign walk_right = (state == R);
    assign digging = ((state == LD) || (state == RD));

endmodule
