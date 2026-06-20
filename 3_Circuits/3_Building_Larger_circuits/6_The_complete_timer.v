module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg [3:0] count,
    output counting,
    output done,
    input ack
);
	// FSM states
    parameter IDLE = 0,
              S1 = 1,
              S11 = 2,
              S110 = 3,
              S1101 = 4,
              SHIFT1 = 5,
              SHIFT2 = 6,
              SHIFT3 = 7,
              COUNT = 8,
              DONE = 9;

    reg [3:0] state, next_state;
    reg [9:0] count_1000;
    always @(posedge clk) begin
        if(reset) state <= IDLE;
        else state <= next_state;
    end

    always @* begin
        case(state)
            IDLE: next_state = data ? S1 : IDLE;
            S1: next_state = data ? S11 : IDLE;
            S11: next_state = data ? S11 : S110;
            S110: next_state = data ? S1101 : IDLE;
            S1101: next_state = SHIFT1;
            SHIFT1: next_state = SHIFT2;
            SHIFT2: next_state = SHIFT3;
            SHIFT3: next_state = COUNT;
            COUNT: next_state = (count == 0 & count_1000 == 999) ? DONE : COUNT;
            DONE: next_state = (ack) ? IDLE : DONE;
        endcase
    end

    always @(posedge clk) begin
        case(state)
            S1101: count[3] <= data;
            SHIFT1: count[2] <= data;
            SHIFT2: count[1] <= data;
            SHIFT3: count[0] <= data;
            COUNT: begin
               if(count >= 0) begin
                    if(count_1000 < 999)
                        count_1000 <= count_1000 + 1'b1;
                    else begin
                        count <= count - 1'b1;
                        count_1000 <= 0;
                    end
               end 
            end
            default: count_1000 <= 0;
        endcase
    end

    assign counting = (state == COUNT);
    assign done = (state == DONE);
endmodule