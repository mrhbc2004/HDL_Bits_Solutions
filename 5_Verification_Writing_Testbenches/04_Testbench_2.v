module top_module();
	reg clk = 0;
    reg in = 0;
    reg [2:0] s;
    wire out;
    
    q7 dut (.clk(clk), .in(in), .s(s), .out(out));
    
    always #5 clk = ~clk;
    
    initial begin // for 'in' generation
    	#20 in = 1;
        #10 in = 0;
        #10 in = 1;
        #30 in = 0;
    end
    
    initial begin
       	s = 3'd2;
        #10 s = 3'd6;
        #10 s = 3'd2;
        #10 s = 3'd7;
        #10 s = 3'd0;
    end
endmodule
