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
    
    parameter L=0,R=1,LF=2,RF=3, LD=4, RD =5;
    reg [2:0] state, next_state;
    
    always @(*) begin
        case(state)
            L: next_state = (~ground)? LF : (dig)? LD : (bump_left)? R : L;
            R: next_state = (~ground)? RF : (dig)? RD : (bump_right)? L : R;
            LF: next_state = (ground)? L : LF;
            RF: next_state = (ground)? R : RF;
            LD: next_state = (ground)? LD : LF;
            RD: next_state = (ground)? RD : RF;
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if(areset)
            state <= L;
        else 
            state <= next_state;
    end
    
    assign aaah = (state == LF) || (state == RF);
    assign walk_left = (state == L);
    assign walk_right = (state == R);
    assign digging = (state == LD) || (state == RD);
    
    

endmodule
