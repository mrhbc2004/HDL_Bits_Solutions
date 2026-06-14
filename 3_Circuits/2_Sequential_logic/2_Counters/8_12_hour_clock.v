module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    
	
    reg [2:0] ena_hms;
    assign ena_hms = {(ena && (mm == 8'h59) && (ss == 8'h59)), (ena && (ss == 8'h59)), ena};
    
    count60 second(clk, reset, ena_hms[0], ss);
    count60 minute(clk, reset, ena_hms[1], mm);
    
    always @(posedge clk) begin
        if(reset) begin
           hh <= 8'h12;
            pm <= 0;
        end
        else begin
            if(ena_hms[2] && mm == 8'h59 && ss == 8'h59) begin
                if(hh == 8'h12) hh <= 8'h1;
                else if(hh == 8'h11) begin 
                    hh[3:0] <= hh[3:0] + 4'h1;
                    pm <= ~pm;
                end
                else if(hh == 8'h9) begin
                    hh[3:0] <= 4'h0;
                    hh[7:4] <= 4'h1;
                end
                else hh[3:0] <= hh[3:0] + 4'h1;
            end
        end
    end
endmodule
module count60(input clk, reset, ena, output reg [7:0]q);
    always @(posedge clk) begin
        if(reset) q <= 8'h0;
        else begin
            if(ena) begin
                if(q[3:0] == 4'h9)begin
                    if(q[7:4] == 4'h5)q <= 8'h0;
                    else begin
                        q[3:0] <= 4'h0;
                        q[7:4] <= q[7:4] + 4'h1;
                    end
                end
                else q[3:0] <= q[3:0] + 4'h1;
            end
            else q <= q;
        end
    end
endmodule