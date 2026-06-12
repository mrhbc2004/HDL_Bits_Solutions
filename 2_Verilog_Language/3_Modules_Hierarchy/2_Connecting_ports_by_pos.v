module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    // mod_a definition is already given in the question description
    mod_a uut(out1, out2, a, b, c, d); // Instantiated and connecting the ports by position

endmodule
