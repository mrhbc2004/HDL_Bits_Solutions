module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
 
    assign s        = a + b;
    // overflow signal is set only when the 8th bit of both a and b are different from 8th bit of sum
    assign overflow = (s[7] ^ a[7]) & (s[7] ^ b[7]);
    
endmodule
