module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    wire r1,r2,r3,g1,g2,g3;
    assign {r3,r2,r1} = r;
    assign g = {g3,g2,g1};
    
    parameter A=0,B=1,C=2,D=3;
    reg[1:0] state, next; 
    
    always@(*) begin
        case(state) 
            A: next = (r1)? B : (r2) ? C : (r3)? D : A;
            B: next = (r1)? B : A;
            C: next = (r2)? C : A;
            D: next = (r3)? D : A;
            default next = A;
        endcase
    end
    
    always@(posedge clk) begin
        if (!resetn)
            state <= A;
        else
            state <= next;
    end
    
    assign g1 = (state == B);
    assign g2 = (state == C);
    assign g3 = (state == D);
    
    
    

endmodule
