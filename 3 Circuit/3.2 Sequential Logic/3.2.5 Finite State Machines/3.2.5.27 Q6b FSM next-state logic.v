module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    parameter E=3'b100, F=3'b101, D=3'b011, C=3'b010, B=3'b001;
    
    assign Y2 = (y==B) || (y==F) || (y==C && w) || (y==E && w);
    

endmodule
