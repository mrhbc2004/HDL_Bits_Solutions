module top_module( 
    input a, 
    input b, 
    output out );

	// xnor gate modeling
    assign out = ~( a ^ b);
    
    // alternate solution_1
    // assign out = a ~^ b;

    // alternate solution_2
    // assign out = (a & b) | (~a & ~b); // boolean expansion
    
endmodule
