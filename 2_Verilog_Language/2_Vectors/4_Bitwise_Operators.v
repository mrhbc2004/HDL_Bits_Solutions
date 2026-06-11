module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    // Bitwise or operator
    assign out_or_bitwise = a | b; // "|" bitwise or operator
	
    // Logical or operator
    assign out_or_logical = a || b; // "||" logical or operator
    
    // Inverse of b in the higher bits of out_not and inverse of a in lower half of out_not
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;
    // alternative solution of out_not
    // assign out_not = {~b, ~a}; // concatenation operator\
    
endmodule
