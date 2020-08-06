module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    always @(posedge clk) begin
        
        q <= (r)? 0:d;
    end

endmodule
