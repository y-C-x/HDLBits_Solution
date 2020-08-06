module top_module (
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	output walk_left,
	output walk_right
);

	// Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	parameter WL=0, WR=1;
	reg state;
	reg next;
    
    
    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
    always@(*) begin
		case (state)
			WL: next = bump_left  ? WR : WL;
			WR: next = bump_right ? WL : WR;
		endcase
    end
    
    
    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
    always @(posedge clk, posedge areset) begin
		if (areset) state <= WL;
        else state <= next;
	end
		
		
	// Combinational output logic. In this problem, an assign statement are the simplest.
	// In more complex circuits, a combinational always block may be more suitable.		
	assign walk_left = (state==WL);
	assign walk_right = (state==WR);

	
endmodule
