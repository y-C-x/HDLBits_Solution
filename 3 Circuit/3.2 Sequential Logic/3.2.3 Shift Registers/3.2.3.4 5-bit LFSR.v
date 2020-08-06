module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    always @(posedge clk) begin
        if (reset)
            q <= 5'h1;
        else 
            q <= {q[0],q[4],q[3]^q[0],q[2],q[1]};
    end

endmodule

/*
module top_module(
	input clk,
	input reset,
	output reg [4:0] q);
	
	reg [4:0] q_next;		// q_next is not a register

	// Convenience: Create a combinational block of logic that computes
	// what the next value should be. For shorter code, I first shift
	// all of the values and then override the two bit positions that have taps.
	// A logic synthesizer creates a circuit that behaves as if the code were
	// executed sequentially, so later assignments override earlier ones.
	// Combinational always block: Use blocking assignments.
	always @(*) begin
		q_next = q[4:1];	// Shift all the bits. This is incorrect for q_next[4] and q_next[2]
		q_next[4] = q[0];	// Give q_next[4] and q_next[2] their correct assignments
		q_next[2] = q[3] ^ q[0];
	end
	
	
	// This is just a set of DFFs. I chose to compute the connections between the
	// DFFs above in its own combinational always block, but you can combine them if you wish.
	// You'll get the same circuit either way.
	// Edge-triggered always block: Use non-blocking assignments.
	always @(posedge clk) begin
		if (reset)
			q <= 5'h1;
		else
			q <= q_next;
	end
	
endmodule
*/


