module top_module (
    input [7:0] in,
    output parity); 
    
    // reduction operator of xor (^)
    assign parity= ^in; // same as in[0] ^ in[1] ^.....^ in[7]
    
endmodule
