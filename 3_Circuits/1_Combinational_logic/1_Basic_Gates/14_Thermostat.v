module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = mode & too_cold; // heater is asserted only when mode is HIGH and too_cold is also HIGH

    assign aircon = ~mode & too_hot; // aircon is asserted only when mode is LOW and too_hot is also HIGH
    
     // fan is switched on when fan_on is asserted OR when either heater OR aircon is asserted
    assign fan    = fan_on | (mode & too_cold) | (~mode & too_hot); 

endmodule
