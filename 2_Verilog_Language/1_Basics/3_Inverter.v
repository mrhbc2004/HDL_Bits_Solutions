module top_module( input in, output out );
    // Inverter through continuous assignment (assign) and ~ (tilde) operator
    assign out = ~in;
    
    // NOTE: ! can also be used instead of ~ but only in 1 bit signals
    // ~ -> Bitwise NOT operator
    // ! -> Logical NOT operator 
    // For multi-bit signals ! doesnt work as expected
    
endmodule
