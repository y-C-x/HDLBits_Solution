module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    
    reg[2:0] state,next;
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    
    always@(*) begin
        case(y)
            A: next = (~x)? A : B;
            B: next = (~x)? B : E;
            C: next = (~x)? C : B;
            D: next = (~x)? B : C;
            E: next = (~x)? D : E; 
        endcase
    end
    
    always@(posedge clk) begin
       state <= next; 
    end

    assign z = (y == D) || (y == E);
    assign Y0 = next[0];
endmodule
