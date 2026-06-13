module top_module (input x, input y, output z);
    
    // intermediate wires declaration
	wire z1, z2, z3, z4, z5, z6;
    // module instantiations 
    A a1(x, y, z1);
    A a2(x, y, z3);
    B b1(x, y, z2);
    B b2(x, y, z4);
    // final output assignment
    assign z5 = z1 | z2;
    assign z6 = z3 & z4;
    assign z  = z5 ^ z6;

endmodule 

// module definition of A
module A(input x, y,
        output z);
    
    assign z = (x ^ y) & x;

endmodule
// module definition of B
module B(input x, y, 
        output z);

    assign z = ~(x ^ y);

endmodule