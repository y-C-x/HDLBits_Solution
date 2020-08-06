module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    wire [3:0] w_input = {KEY[3],LEDR[3],LEDR[2],LEDR[1]};
    generate 
        genvar i;
        for(i=0;i<4;i=i+1) begin: muxdff
            MUXDFF (
        	.clk(KEY[0]),
            .w(w_input[i]),
            .R(SW[i]),
        	.E(KEY[1]),
        	.L(KEY[2]),
            .Q(LEDR[i])
    		);
        end
    endgenerate
endmodule


module MUXDFF (
    input clk,
    input w, R, E, L,
    output  Q
);
    reg Q_r;
    wire d_in = (L)?R:(E)?w:Q_r;
	always@(posedge clk)begin
    	Q_r <= d_in;
    end
    assign Q = Q_r;
endmodule