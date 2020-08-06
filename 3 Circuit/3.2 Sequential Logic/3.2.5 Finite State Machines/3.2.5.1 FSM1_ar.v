module top_module (
	input clk,
	input in,
	input areset,
	output out
);

	// Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	parameter A=0, B=1;
	reg state;		// Ensure state and next are big enough to hold the state encoding.
	reg next;
    
    
    // A finite state machine is usually coded in three parts:
    //   State transition logic
    //   State flip-flops
    //   Output logic
    // It is sometimes possible to combine one or more of these blobs of code
    // together, but be careful: Some blobs are combinational circuits, while some
    // are clocked (DFFs).
    
    
    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.
    always@(*) begin
		case (state)
			A: next = in ? A : B;
			B: next = in ? B : A;
		endcase
    end
    
    
    
    // Edge-triggered always block (DFFs) for state flip-flops. Asynchronous reset.
    always @(posedge clk, posedge areset) begin
		if (areset) state <= B;		// Reset to state B
        else state <= next;			// Otherwise, cause the state to transition
	end
		
		
		
	// Combinational output logic. In this problem, an assign statement is the simplest.
	// In more complex circuits, a combinational always block may be more suitable.
	assign out = (state==B);

	
endmodule
