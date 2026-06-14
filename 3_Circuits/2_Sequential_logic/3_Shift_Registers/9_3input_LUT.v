module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [7:0] Q;
    // sequential block
    always @(posedge clk) begin
        if(enable) begin
            Q <= {Q[6:0], S}; 
        end
        else Q <= Q;
    end
    // combinational block
    always @* begin
        Z = Q[{A, B, C}];
    end

endmodule
