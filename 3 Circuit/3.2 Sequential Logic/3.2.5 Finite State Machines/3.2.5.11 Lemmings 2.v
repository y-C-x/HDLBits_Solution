module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter L=0,R=1,LF=2,RF=3;
    reg [1:0] state, next_state;
    
    always @(*) begin
        case(state)
            L: next_state = (~ground)? LF : (bump_left)? R : L;
            R: next_state = (~ground)? RF : (bump_right)? L : R;
            LF: next_state = (ground)? L : LF;
            RF: next_state = (ground)? R : RF;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= L;
        else
            state <= next_state;
        
    end
    
    
    assign walk_left = (state == L);
    assign walk_right = (state == R);
    assign aaah = (state == LF) || (state == RF);


endmodule
