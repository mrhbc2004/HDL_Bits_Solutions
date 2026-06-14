module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire in, d;
  
    assign in = E ? w : Q;
    
    assign d = L ? R : in;
    
    always @(posedge clk) Q <= d;

endmodule
