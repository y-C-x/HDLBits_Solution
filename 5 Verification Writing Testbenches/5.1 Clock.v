module top_module ( );
    reg clk;
    dut clock(clk);
    
    initial begin
        clk = 1'b0;
        forever
        #5
        clk = ~clk;
    end
    
    /*
    initial begin
        clk = 1'b0;
    end
    
    always begin
        #5
        clk = ~clk;
    end
    */

endmodule
