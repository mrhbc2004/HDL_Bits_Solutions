module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    // wire declaration of 100 bit for catching intermediate carry
    wire [99:0] c;
    
    // the first full_adder instantiation
    fa a1(a[0], b[0], cin, sum[0], c[0]);
    // iterator variable for generate for loop
    genvar i;
    generate
        for(i = 1; i < 100; i = i + 1) begin : fa_loop // generate block containing for loop with name
            fa a2(a[i], b[i], c[i-1], sum[i], c[i]); // instantiation of the full_adder with generate loop
        end
    endgenerate
    // connection of final c to cout 
    assign cout=c;
endmodule

// module definition of full adder 
module fa(input a,b,cin,
          output sum,cout);
    // using concatenation operator 
    assign {cout,sum} = a + b + cin;
endmodule