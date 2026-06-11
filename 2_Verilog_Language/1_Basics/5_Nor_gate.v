module top_module( 
    input a, 
    input b, 
    output out );
	
    // nor gate modeled using assign statement, | (pipe) and [~ (tilde)]/[! (exclamation)] operator
    assign out = ~( a | b);

    // alternated solution
    // assign out = ~a & ~b; 
    
endmodule
