module top_module (
	input a, 
	input b, 
	output q
);

	// This is a combinational circuit with one gate. The truth table
	// can be found by looking at the simulation waveforms.
	assign q = a & b;
	
endmodule
