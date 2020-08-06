module top_module (
	input sel,
	input [7:0] a,
	input [7:0] b,
	output reg [7:0] out
);

	// 1. A mux coded as (~sel & a) | (sel & b) does not work for vectors.
	// This is because these are bitwise operators, and sel is only a 1 bit wide quantity,
	// which leaves the upper bits of a and b zeroed. It is possible to code it using
	// the replication operator, but this is somewhat difficult to read:
	//   ( {8{~sel}} & a ) | ( {8{sel}} & b )
	
	// 2. The simulation waveform shows that when sel = 1, a should be selected. This
	// is flipped in the suggested code.

    assign out = sel ? a : b;
	
endmodule
