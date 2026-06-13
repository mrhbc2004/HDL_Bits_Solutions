module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
	// intermediate wire modeling
	wire i;
    // xnor gate modeling
    assign i = ~(in1 ^ in2);
    // final output modeling
    assign out = i ^ in3;

endmodule
