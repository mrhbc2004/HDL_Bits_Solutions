module top_module( 
    input [2:0] in,
    output [1:0] out );
    // integer iterator variable
    int i;
    // combinational block
	always @* begin
        out = 2'd0;
        for(i = 0;i < 3;i = i + 1) begin 
            out = out + in[i];
        end
    end
endmodule
