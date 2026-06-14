module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    kit uut(.clk(KEY[0]), .L(KEY[1]), .r(SW), .q(LEDR));

endmodule
module kit(
    input clk, L,
    input [2:0] r,
    output [2:0] q);

    wire [2:0] m_o;
    wire x_o;
    
    always @(posedge clk) begin
        q[0] <= m_o[0];
        q[1] <= m_o[1];
        q[2] <= m_o[2];
    end
    
    always @* begin
        m_o[0] = L ? r[0] : q[2];
        m_o[1] = L ? r[1] : q[0];
        m_o[2] = L ? r[2] : x_o;
        x_o = q[1] ^ q[2];
    end

endmodule