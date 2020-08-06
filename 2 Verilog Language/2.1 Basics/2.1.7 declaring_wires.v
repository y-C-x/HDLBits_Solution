`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire in1,in2;
    assign in1 = a & b;
    assign in2 = c & d;
    assign out = in1 | in2;
    assign out_n = ~(in1 | in2);
    

endmodule
