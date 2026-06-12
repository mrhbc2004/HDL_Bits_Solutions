module top_module( 
    input [99:0] in,
    output [99:0] out
);
    // iterator variable
    int i;
    // 100 bit wire for intermediate signal
    wire [99:0] in1;
    
    always @* begin 
        for(i = 0; i < 100; i = i + 1) begin
            in1[99-i] = in[i];
        end
        out = in1;
    end

endmodule
