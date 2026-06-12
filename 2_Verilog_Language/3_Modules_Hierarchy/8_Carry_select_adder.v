module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    // wire declarations for intermediate wires
    wire c1, c2, c3;
    // 16-bit vectors declared for intermediate sums
    wire [15:0] s1, s0;
    
    // instantiations of add16 modules
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],c1);
    add16 a2(a[31:16],b[31:16],1'b0,s0,c2);
    add16 a3(a[31:16],b[31:16],1'b1,s1,c3);
    
    // mux modeling for sum
    assign sum[31:16] = c1 ? s1 : s0;

endmodule
