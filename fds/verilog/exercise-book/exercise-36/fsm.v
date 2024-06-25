module fsm(
    input clk,
    input reset,
    input W,
    output reg Z
);

reg [1:0] next_state;
reg [1:0] current_state;

// next-state calculation
always @* begin
    // fallback value
    next_state <= 3'b000;

    case ({ current_state, W })
        3'b000: next_state <= 2'b10;
        3'b010: next_state <= 2'b01;
        3'b100: next_state <= 2'b11;
        3'b110: next_state <= 2'b10;

        3'b001: next_state <= 2'b11;
        3'b011: next_state <= 2'b00;
        3'b101: next_state <= 2'b00;
        3'b111: next_state <= 2'b01;

        default: next_state <= 2'b00;
    endcase
end

// next-state assignation
always @(posedge clk) begin

    if (reset) begin
        current_state <= 2'b00;
    end else begin
        current_state <= next_state;
    end
    
end

// output calculation
always @* begin
    Z = current_state == 11;
end


endmodule
