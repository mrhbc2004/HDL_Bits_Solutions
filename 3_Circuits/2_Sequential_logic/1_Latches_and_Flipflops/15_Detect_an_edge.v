module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg [7:0] in_tmp; // to detect an edge we need to store the previous value 
    
    int i; // iterator variable
    
    always @(posedge clk) in_tmp <= in;
    
    always @(posedge clk) begin
        for(i = 0; i < 8; i = i + 1) begin
            if(in_tmp[i] != in[i] && in[i] == 1) pedge[i] = 1; 
            else pedge[i] = 0;
        end
    end

endmodule
