module top_module( 
    input a, b, sel,
    output out ); 
    assign out = (sel==1)?b:a;
endmodule