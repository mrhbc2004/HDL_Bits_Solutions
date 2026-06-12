// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    // shut_off_computer is asserted only when cpu_overheated is asserted
    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else shut_off_computer = 0;
    end

    // if not yet arrived at the destination then keep_driving is asserted until gas_tank is empty
    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else keep_driving = 0;
    end

endmodule
