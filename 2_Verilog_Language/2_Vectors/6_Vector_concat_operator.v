module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // using concatenation operators with vectors of different sizes
    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11}; // as the size didn't match we are latching last two bits to 2'b11

endmodule
