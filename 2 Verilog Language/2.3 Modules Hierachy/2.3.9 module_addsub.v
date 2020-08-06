module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout,cout2;
    wire [31:0] b_in;
    assign b_in = b^{32{sub}};
    add16 a1(a[15:0],b_in[15:0],sub,sum[15:0],cout);
    add16 a2(a[31:16],b_in[31:16],cout,sum[31:16],cout2);

endmodule
