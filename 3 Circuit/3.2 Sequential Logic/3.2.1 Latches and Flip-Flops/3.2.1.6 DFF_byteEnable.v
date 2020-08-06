module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        case(byteena)
            2'b01: q <= (~resetn)? 16'd0:{q[15:8],d[7:0]};
            2'b10: q <= (~resetn)? 16'd0:{d[15:8],q[7:0]};
            2'b11: q <= (~resetn)? 16'd0:{d[15:8],d[7:0]};
        endcase
        
    end
endmodule
