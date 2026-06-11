module top_module( 
    input a,b,c,
    output w,x,y,z );
    
    // Continuous assignment 
    // a->w, b->x,y c->z
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;

endmodule