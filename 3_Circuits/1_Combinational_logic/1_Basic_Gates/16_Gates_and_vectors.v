module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    // iterator variables 
	int i, j, k;
    // combinational block
    always @* begin 
        out_both            = 3'd0;
        out_any             = 3'd0;
        out_different       = 3'd0;
        out_different[3]    = in[3] ^ in[0];
        for(i = 0; i < 3; i = i + 1) out_both[i]      = in[i] & in[i+1];
        for(j = 3; j > 0; j = j - 1) out_any[j]       = in[j] | in[j-1];
        for(k = 0; k < 3; k = k + 1) out_different[k] = in[k] ^ in[k+1];
    end
endmodule
