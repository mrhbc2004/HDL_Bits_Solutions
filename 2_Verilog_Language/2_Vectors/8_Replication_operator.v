module top_module (
    input [7:0] in,
    output [31:0] out );//

    // using both replication and concatenation operator
    assign out = { {24{in[7]}}, in};

endmodule