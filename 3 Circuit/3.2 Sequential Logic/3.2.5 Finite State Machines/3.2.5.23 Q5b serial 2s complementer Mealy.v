module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter a=0,b=1;
    reg state,next;
    
    always@(*) begin
        case(state)
            a: next = (x)? b:a;
            b: next = b;
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if (areset) 
            state <= a;
        else
            state <= next; 
    end
    
    assign z = (state == a) & x || (state == b) & ~x;
         
endmodule
