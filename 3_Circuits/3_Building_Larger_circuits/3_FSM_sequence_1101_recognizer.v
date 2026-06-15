module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
	
    
    reg [1:0] state, next_state;
    // parameter definition for sequence checking in Mealy FSM (overlapping)
    // A -> -, B -> 1, C -> 11, D -> 110 
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    // sequential block
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            start_shifting <= 1'b0;
        end else begin
            state <= next_state;
        end
        
        if ((state == D) && (data == 1'b1)) start_shifting <= 1'b1;
    end
    
    // combinational block
    always @* begin
        case(state)
            A: next_state = data ? B : A;
            B: next_state = data ? C : A;
            C: next_state = data ? C : D;
            D: next_state = data ? B : A;
            default: next_state = state;
        endcase
    end
    
endmodule
