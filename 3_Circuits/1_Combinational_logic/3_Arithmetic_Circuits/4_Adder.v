module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    // wire declaration for storing intermediate results
    wire [2:0] c;
    // module instantiations of 1bit full_adder for 4 bit full_adder
    fadd f1(x[0],y[0],1'b0,sum[0],c[0]);
    
    fadd f2(x[1],y[1],c[0],sum[1],c[1]);
    
    fadd f3(x[2],y[2],c[1],sum[2],c[2]);
    
    fadd f4(x[3],y[3],c[2],sum[3],sum[4]);

endmodule
// module definition of full_adder
module fadd(input a, b, cin, 
            output sum, cout);
            
    assign {cout, sum} = a + b + cin;

endmodule
