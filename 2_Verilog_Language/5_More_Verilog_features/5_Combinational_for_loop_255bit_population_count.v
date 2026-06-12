module top_module( 
    input [254:0] in,
    output [7:0] out );
    // iterator variable
    int i;
    // 8 bit intermediate signal
    wire [7:0] o;
    
	always @* begin 
        o = 8'd0; // set it to 0 for every transition in input signal (in)
        for(i = 0; i < 255; i = i + 1) begin 
            if(in[i]) o = o + 8'd1; // if bit is high then add 1 to o signal
            else ;
        end
        out = o; // at the end assign o to out
    end
endmodule
 