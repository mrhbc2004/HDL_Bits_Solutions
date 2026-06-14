module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    deccount c1(clk, reset, 1'b1, q[3:0]);
    deccount c2(clk, reset, ena[1], q[7:4]);
    deccount c3(clk, reset, ena[2], q[11:8]);
    deccount c4(clk, reset, ena[3], q[15:12]);
    
    assign ena[1] = (q[3:0] == 4'd9) ? 1 : 0;
    assign ena[2] = ((q[7:4] == 4'd9) && (q[3:0] == 4'd9)) ? 1 : 0;
    assign ena[3] = ((q[11:8] == 4'd9) && (q[7:4] == 4'd9) && (q[3:0] == 4'd9)) ? 1 : 0;

endmodule

module deccount(input clk,reset,ena,
                output [3:0] cnt);

    always @(posedge clk) begin
        if(reset || (ena && (cnt == 4'd9))) cnt <= 4'd0;
        else if(ena) cnt <= cnt + 4'd1;
        else cnt <= cnt;
    end
endmodule