module top_module(
	input [1:0] A,
	input [1:0] B,
	output z);
    // assign z = (A[0] == B[0]) && (A[1] == B[1]);
	assign z = (A[1:0]==B[1:0]);	// Comparisons produce a 1 or 0 result.
	
	// Another option is to use a 16-entry truth table ( {A,B} is 4 bits, with 16 combinations ).
	// There are 4 rows with a 1 result.  0000, 0101, 1010, and 1111.

endmodule
