module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if (slowena) begin
        if (q == 4'd9) 
            q<=0;
        else
            q<=q+1;
        end
        if(reset) begin
            q<=0;
        end
    end
    

endmodule
