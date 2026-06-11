module top_module( 
    input a, 
    input b, 
    output out );
    
    // And gate modeled through assign statement and & (ampersand) operator
    assign out = a & b;
    
endmodule
