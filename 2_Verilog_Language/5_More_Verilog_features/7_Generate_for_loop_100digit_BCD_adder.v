module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    // wire declaration of 100 bit for catching intermediate carry
    wire [99:0] c;
    
    // first full_adder instantiation of bcd_fadd
    bcd_fadd f1(a[3:0], b[3:0], cin, c[0], sum[3:0]);
    
    // iterator variable for generate for loop
    genvar i;
    generate 
        for(i = 1; i < 100; i = i + 1) begin: bcd_loop // generate block containing for loop with name
            bcd_fadd f1(a[4*i+3:4*i], b[4*i+3:4*i], c[i-1], c[i], sum[4*i+3:4*i]); // logic of vector part select to make sure bcd_addition is possible
        end
    endgenerate
    // final assignment of 100th bit of carry to cout
    assign cout = c[99];
endmodule
