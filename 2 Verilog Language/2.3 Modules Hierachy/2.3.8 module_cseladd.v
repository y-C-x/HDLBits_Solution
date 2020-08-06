module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2a,cout2b;
    wire [15:0] sum2a,sum2b;
    add16 add1(a[15:0],b[15:0],0,sum[15:0],cout1);
    add16 add2a(a[31:16],b[31:16],0,sum2a,cout2a);
    add16 add2b(a[31:16],b[31:16],1,sum2b,cout2b);
    
    always @(*) begin
        case (cout1)
            0: sum[31:16] = sum2a;
            1: sum[31:16] = sum2b;
            
        endcase
        
    end

endmodule