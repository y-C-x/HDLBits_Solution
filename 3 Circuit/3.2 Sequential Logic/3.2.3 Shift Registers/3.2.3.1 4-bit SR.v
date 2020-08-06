module top_module(
	input clk,
	input areset,
	input load,
	input ena,
	input [3:0] data,
	output reg [3:0] q);
	
	// Asynchronous reset: Notice the sensitivity list.
	// The shift register has four modes:
	//   reset
	//   load
	//   enable shift
	//   idle -- preserve q (i.e., DFFs)
	always @(posedge clk, posedge areset) begin
		if (areset)		// reset
			q <= 0;
		else if (load)	// load
			q <= data;
		else if (ena)	// shift is enabled
			q <= q[3:1];	// Use vector part select to express a shift.
	end
	
endmodule
