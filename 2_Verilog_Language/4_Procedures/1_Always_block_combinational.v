// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    // using assign statement
    assign out_assign = a & b;
    
    // using always @* block (combinational)
    always @* out_alwaysblock = a & b;

endmodule
