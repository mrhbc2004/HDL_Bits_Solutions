module top_module (
    input clk,
    input d,
    output q
);
    reg [1:0] in;
  
    always @(posedge clk) in[0] <= d;
  
    always @(negedge clk) in[1] <= d;
  
    assign q = clk ? in[0] : in[1];

endmodule
