module top_module ();
    reg clk = 0;
    reg reset = 0;
    reg t = 0;
    wire q;
    
    always #5 clk = ~clk; // clock generation
    
    tff dut (.clk(clk), .reset(reset), .t(t), .q(q));// module instantiation

    // for reset
    initial begin
        reset = 1;
        #10 reset = 0;
        #10 t = 1;
    end

endmodule
