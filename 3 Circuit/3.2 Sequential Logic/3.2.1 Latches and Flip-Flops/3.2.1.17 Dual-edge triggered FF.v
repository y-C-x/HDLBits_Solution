module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d_last;
    wire [31:0] state;
    assign state = d_last & ~in;
    always@( posedge clk) begin
        d_last <= in;
        if (reset) begin
            out <= '0;
        end
 		else begin
            for (int i = 0; i<32; i++) begin
                if(state[i] == 1'b1)
                  out[i] <= 1'b1;
                
            end
        end
        
    end

endmodule
