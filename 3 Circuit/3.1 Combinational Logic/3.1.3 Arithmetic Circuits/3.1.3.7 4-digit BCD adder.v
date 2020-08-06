module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire c1,c2,c3;
    bcd_fadd b1(a[3:0],b[3:0],cin,c1,sum[3:0]);
    bcd_fadd b2(a[7:4],b[7:4],c1,c2,sum[7:4]);
    bcd_fadd b3(a[11:8],b[11:8],c2,c3,sum[11:8]);
    bcd_fadd b4(a[15:12],b[15:12],c3,cout,sum[15:12]);

endmodule
