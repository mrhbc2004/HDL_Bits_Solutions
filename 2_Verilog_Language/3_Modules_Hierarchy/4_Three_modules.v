module top_module ( input clk, input d, output q );

    // wire declarations for intermediate nets
    wire q1, q2;
    // Three instantiations of my_dff with d1, d2, d3 and connecting the ports by position
    my_dff d1(clk, d,  q1);
    my_dff d2(clk, q1, q2);
    my_dff d3(clk, q2, q);
    
endmodule
