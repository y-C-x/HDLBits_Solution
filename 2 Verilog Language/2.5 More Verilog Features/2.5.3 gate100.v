module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    assign {out_and,out_or,out_xor} = {&in,|in,^in};

endmodule
