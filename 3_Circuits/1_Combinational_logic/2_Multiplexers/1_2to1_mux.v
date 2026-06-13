module top_module( 
    input a, b, sel,
    output out ); 
    
    assign out = sel ? b : a; // 2x1 MUX

endmodule
