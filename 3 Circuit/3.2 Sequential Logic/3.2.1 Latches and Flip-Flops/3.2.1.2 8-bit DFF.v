module top_module(
	input clk,
	input [7:0] d,
	output reg [7:0] q);
	
	// Because q is a vector, this creates multiple DFFs.
	always @(posedge clk)
		q <= d;
	
endmodule
