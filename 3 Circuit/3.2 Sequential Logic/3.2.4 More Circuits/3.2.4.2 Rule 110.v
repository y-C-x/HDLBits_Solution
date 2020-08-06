module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    always @(posedge clk) begin
        if(load)
            q <= data;
        else
            q <= q^{q[510:0],1'b0} | q  & ~{1'b0,q[511:1]} ;
    end
          
endmodule
