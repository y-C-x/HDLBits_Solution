module top_module (
    input a, b, c, d, e,
    output [24:0] out );//
    wire [4:0] k = {a,b,c,d,e};
    assign out[24:20] = ~ {5{a}} ^ k;
    assign out[19:15] = ~ {5{b}} ^ k;
    assign out[14:10] = ~ {5{c}} ^ k;
    assign out[9:5] = ~ {5{d}} ^ k;
    assign out[4:0] = ~ {5{e}} ^ k;
endmodule
