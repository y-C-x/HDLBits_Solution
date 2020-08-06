module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;
    
    initial begin
        clk = 0;
        reset = 0;
        t = 0;
        #3;
        reset = 1'b1;
        #10;
        reset = 1'b0;   
    end
    
    always begin
        #5
        clk = ~clk;
    end
    
    always@(posedge clk)begin
        if(reset)begin
            t <= 1'b0;
        end
        else begin
            t <= 1'b1;
        end
    end

    
    tff u_tff(clk,reset,t,q);

endmodule
