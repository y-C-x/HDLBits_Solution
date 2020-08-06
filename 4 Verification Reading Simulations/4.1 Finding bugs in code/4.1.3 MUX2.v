module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] out1, out2;
    mux2 mux0 ( sel[0],    a,    b, out1 );
    mux2 mux1 ( sel[0],    c,    d, out2 );
    mux2 mux2 ( sel[1], out1, out2,  out );

endmodule
