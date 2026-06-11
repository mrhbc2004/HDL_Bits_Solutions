`default_nettype none
// used to catch the undeclarations of any nets
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	
    // wire declarations
    wire w1, w2, w3;
    
    // and gates (level 1)
    assign w1 = a & b;
    assign w2 = c & d;
    
    // or gate (level 2)
    assign w3 = w1 | w2;
    
    // not gate (level 3)
    assign out_n = ~w3;
    
    // output 
    assign out = w3;
    
endmodule
