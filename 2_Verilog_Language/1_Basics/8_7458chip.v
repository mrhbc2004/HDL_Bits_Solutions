module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    // wire declarations
    wire a,b,c,d;
    
    // Level 1
    assign a   = p1a & p1b & p1c;
    assign b   = p1d & p1e & p1f;
    assign c   = p2a & p2b;
    assign d   = p2c & p2d;
    
    // Level 2
	assign p1y = a | b;
    assign p2y = c | d;

endmodule
