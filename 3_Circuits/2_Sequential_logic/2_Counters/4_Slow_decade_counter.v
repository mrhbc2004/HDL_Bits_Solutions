module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        // if reset is asserted or both slwoena AND output reaches 9
        if(reset | (slowena & (q == 4'h9))) q <= 4'h0; 
        else if(slowena) q <= q + 4'h1; // otherwise increment the output by 1 if slowena is asserted
    end

endmodule
