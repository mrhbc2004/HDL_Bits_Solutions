module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    // wire declarations for intermediate nets
    wire c1, c2;
    // 32 bit vector for xor gate output
    wire [31:0] b_s;
    
    // as the sub is 1-bit signal-> replication operator has been used
    assign b_s = {32{sub}} ^ b;
    
    // alternative solution for xor gate
    // assign b_s=sub?(~b):b;
    
    // add16 module instantiations 
    add16 a1(a[15:0], b_s[15:0], sub, sum[15:0], c1);
    add16 a2(a[31:16], b_s[31:16], c1, sum[31:16], c2);
    

endmodule
