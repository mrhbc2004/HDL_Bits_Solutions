module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    // 4 inputs are given as vectors so we will use reduction operators
    assign out_and = &in; // in[0] & in[1] & in[2] & in[3]
    
    assign out_or = |in; // in[0] | in[1] | in[2] | in[3]
    
    assign out_xor = ^in; // in[0] ^ in[1] ^ in[2] ^ in[3]

endmodule
