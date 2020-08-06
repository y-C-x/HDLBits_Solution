module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]dlast;
    
    always @ (posedge clk) begin
        dlast <= in;
        anyedge <= dlast ^ in;
    end

endmodule
