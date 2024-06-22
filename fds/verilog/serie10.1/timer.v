module timer(
    input in, reset, clk,
    output reg f
);

parameter STATE_IDLE = 2'b00;
parameter STATE_A = 2'b01;
parameter STATE_B = 2'b10;

reg [3:0] timer = 0;
reg [1:0] state = STATE_IDLE;
reg [1:0] next_state = STATE_IDLE;

always @* begin
    if (~reset || !in) begin
        next_state = STATE_IDLE;
        timer = 0;
    end else if (state == STATE_A & timer == 9) begin
        next_state = STATE_B;
    end else if (in & state == STATE_IDLE) begin
        next_state = STATE_A;
    end
end

always @(posedge clk) begin

    state = next_state;
    if (state == STATE_A) begin
        timer = timer + 1;
    end

end

always @* begin

    f = state == STATE_B;

end

endmodule
