module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in = (c&d)?4'b1001:(c)?4'b0101:(d)?4'b0001:4'b0100;
endmodule
