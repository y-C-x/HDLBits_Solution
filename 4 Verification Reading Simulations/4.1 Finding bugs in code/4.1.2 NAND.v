module top_module (input a, input b, input c, output out);//
	wire and_out;
    andgate inst1(and_out, a, b, c, 1, 1 );
	assign out = ~and_out;
endmodule
