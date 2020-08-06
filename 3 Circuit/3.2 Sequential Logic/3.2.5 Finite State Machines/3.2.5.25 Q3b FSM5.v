module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    parameter A=0,B=1,C=2,D=3,E=4;
    reg[2:0] state, next;
    
    always@(*) begin
        case(state)
            A: next = (~x)? A : B;
            B: next = (~x)? B : E;
            C: next = (~x)? C : B;
            D: next = (~x)? B : C;
            E: next = (~x)? D : E;
        endcase
    end
    
    always@(posedge clk) begin
        if (reset)
            state <= A;
        else
            state <= next;
    end
    
    assign z = (state == D) || (state == E);
    
    
endmodule
