module top_module (
	input clk,
	input enable,
	input S,
	
	input A, B, C,
	output reg Z
);

	reg [7:0] q;
	
	// The final circuit is a shift register attached to a 8-to-1 mux.
	


	// Create a 8-to-1 mux that chooses one of the bits of q based on the three-bit number {A,B,C}:
	// There are many other ways you could write a 8-to-1 mux
	// (e.g., combinational always block -> case statement with 8 cases).
	assign Z = q[ {A, B, C} ];



	// Edge-triggered always block: This is a standard shift register (named q) with enable.
	// When enabled, shift to the left by 1 (discarding q[7] and and shifting in S).
	always @(posedge clk) begin
		if (enable)
			q <= {q[6:0], S};	
	end
	
	
	
endmodule
