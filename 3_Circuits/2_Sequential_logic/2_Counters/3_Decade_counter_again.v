module top_module (
    input clk,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        if(reset | (q == 4'ha)) q <= 4'h1; // reset the output to zero when reset is asserted or q reaches 10
        else q <= q + 1; // otherwise increment by 1
    end
endmodule
