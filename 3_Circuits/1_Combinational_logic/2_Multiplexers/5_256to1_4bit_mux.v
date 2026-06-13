module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    // combinational block
	always @* begin 
        out = in[4*sel +: 4]; // the logic is to select 4 bit wide based on sel
    end

endmodule
