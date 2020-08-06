module top_module (
    input clk,
    input x,
    output z
); 
    reg q,q1,q2;
    always @(posedge clk)
        begin

            q<= q^x;
            q1<= ~q1 && x;
            q2<= ~q2 || x;

        end 
    assign z=~(q | q1 | q2);
endmodule