module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        if (reset | (q == 4'hf)) q <= 4'h0; // reset the output to zero when reset is asserted or q reaches 15
        else q <= q + 4'h1; // otherwise increment by 1
    end
endmodule
