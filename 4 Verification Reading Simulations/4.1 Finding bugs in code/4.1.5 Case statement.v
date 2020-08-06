module top_module (
	input [7:0] code,
	output reg [3:0] out,
	output reg valid
);

	// A combinational always block.
	always @(*) begin
		out = 0;		// To avoid latches, give the outputs a default assignment
		valid = 1;		//   then override them in the case statement. This is less
						//   code than assigning a value to every variable for every case.
		case (code)
			8'h45: out = 0;
			8'h16: out = 1;
			8'h1e: out = 2;
			8'h26: out = 3;		// 8'd26 is 8'h1a
			8'h25: out = 4;
			8'h2e: out = 5;
			8'h36: out = 6;
			8'h3d: out = 7;
			8'h3e: out = 8;
			8'h46: out = 9;
			default: valid = 0;
		endcase
	end
	
endmodule
