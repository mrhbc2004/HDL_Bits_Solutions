module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);	
    wire [31:0] in_tmp;

    always @(posedge clk) begin
        in_tmp  <=  in;
        if(reset) out <= 32'h00000000;
        else begin
            out <= (in_tmp & ~in) | out;
        end
        
    end

endmodule
