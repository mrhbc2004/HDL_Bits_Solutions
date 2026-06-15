module top_module (
    input clk,
    input reset,
    output shift_ena
);

    parameter A=2'd0, B=2'd1, C=2'd2;

    reg [1:0] state, next_state;
    reg [1:0] count;

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(*) begin
        case(state)
            A: next_state = reset ? B : A;
            B: next_state = C;

            // stay in C for 3 cycles
            C: next_state = (count == 2) ? A : C;

            default: next_state = A;
        endcase
    end

    always @(posedge clk) begin
        if (state != C)
            count <= 0;
        else
            count <= count + 2'd1;
    end

    assign shift_ena = (state == B) || (state == C);

endmodule