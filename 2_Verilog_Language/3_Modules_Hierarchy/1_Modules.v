module top_module ( input a, input b, output out );
    
    // mod_a is already defined and given in the description of the question
    mod_a uut(a,b,out); // Instantiating the mod_a as uut and connecting the ports by position
    
endmodule