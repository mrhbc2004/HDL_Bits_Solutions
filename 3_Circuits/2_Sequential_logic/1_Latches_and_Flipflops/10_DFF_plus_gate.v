module top_module (
    input clk,
    input in, 
    output out);
    // intermediate result stored using wire
    wire d;
    // flip flop modeling 
    always @(posedge clk) out <= d;
	// assigning the intermediate wire 
    assign d = in ^ out;

endmodule
