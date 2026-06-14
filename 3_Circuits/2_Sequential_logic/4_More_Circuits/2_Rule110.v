module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 	
    
    wire [511:0] left, right, centre;
    
    assign left = {1'b0, q[511:1]};
    
    assign centre = q;
    
    assign right = {q[510:0], 1'b0};
    
    always @(posedge clk) begin
        if(load) q <= data;
        else q <= ((centre ^ right) & left) | (~left & (centre | right));
    end

endmodule
