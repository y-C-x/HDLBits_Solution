module top_module(
	input clk,
	input d,
	output reg q);
	
	// Use non-blocking assignment for edge-triggered always blocks
	always @(posedge clk)
		q <= d;

	// Undefined simulation behaviour can occur if there is more than one edge-triggered
	// always block and blocking assignment is used. Which always block is simulated first?
	
endmodule
