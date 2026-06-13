module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    // motor will be asserted only when both ring and vibrate mode are asserted
    assign motor = ring & vibrate_mode;
    // ringer will be asserted only when ring is asserted and vibrate_mode is not asserted
    assign ringer = ring & ~vibrate_mode;

endmodule
