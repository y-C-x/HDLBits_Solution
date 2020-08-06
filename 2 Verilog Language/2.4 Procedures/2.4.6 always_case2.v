
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        pos = (in[0]&1)?2'd0:(in[1]&1)?2'd1:(in[2]&1)?2'd2:(in[3]&1)?2'd3:2'd0;
    end
endmodule
