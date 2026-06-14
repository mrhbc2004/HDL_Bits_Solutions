module top_module (
    input clock,
    input a,
    output p,
    output q );

    always @(negedge clock) q <= p;
    
    always @* begin
        if(clock) p = a;
        else p = p;
    end

endmodule
