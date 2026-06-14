module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF d1(KEY[0], KEY[3], KEY[1], KEY[2], SW[3], LEDR[3]);
    MUXDFF d2(KEY[0], LEDR[3], KEY[1], KEY[2], SW[2], LEDR[2]);
    MUXDFF d3(KEY[0], LEDR[2], KEY[1], KEY[2], SW[1], LEDR[1]);
    MUXDFF d4(KEY[0], LEDR[1], KEY[1], KEY[2], SW[0], LEDR[0]);

endmodule

module MUXDFF (
	input clk, w, E, L, R,
    output Q);

    wire w1, w2;
    
    assign w1 = E ? w : Q;
    
    assign w2 = L ? R : w1;
    
    always @(posedge clk) begin
         Q <= w2;
    end

endmodule
