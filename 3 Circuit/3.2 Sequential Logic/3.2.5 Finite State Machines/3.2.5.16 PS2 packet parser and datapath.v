module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter B1=0, B2=1, B3=2, d=3;
    reg[1:0] state, next;
    
    // FSM from fsm_ps2
    always @(*) begin
        case(state)
            B1: next = (in[3])? B2:B1;
            B2: next = B3;
            B3: next = d;
            d: next = (in[3])? B2:B1;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset)
            state <= B1;
        else begin
            state <= next;
            case(next)
                B2: out_bytes[23:16] = in;
                B3: out_bytes[15:8] = in;
                d: out_bytes[7:0] = in;
            endcase
        end
        
    end

    // New: Datapath to store incoming bytes.
    assign done = (state == d);
endmodule
