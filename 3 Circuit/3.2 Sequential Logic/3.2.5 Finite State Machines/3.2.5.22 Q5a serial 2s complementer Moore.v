module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter a=0, b=1, c=2;
    reg[1:0] state,next;
    
    always@(*) begin
        case(state)
            a: next = (x)? b : a;
            b: next = (x)? c : b;
            c: next = (x)? c : b;
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if (areset) 
            state <= a;
        else
            state <= next;
    end
    
    assign z = (state == b);
    

endmodule
