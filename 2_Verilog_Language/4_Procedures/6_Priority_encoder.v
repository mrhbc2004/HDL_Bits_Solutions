// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
	
    always @* begin
        casez(in) // use casez instead of casex, because the casez has ?/z has dont cares
            4'b???1: pos = 0;
            4'b??10: pos = 1;
            4'b?100: pos = 2;
            4'b1000: pos = 3;
            default: pos = 0;
        endcase
    end

    // alternative solution
    // integer i;
    // always @(in) begin
    //     pos = 0;
    //     for (i = 3; i >= 0; i = i - 1) begin // for LSB priority we need to reverse the loop ordering
    //         if(in[i] )
    //             pos = i;
    //     end
    // end
endmodule