module fsm(
    input clk,
    input reset,
    input W,
    output reg Z
);

reg [1:0] y;
reg [1:0] y_next;

always @* begin
    y_next[0] = W ^ (y[0] ^ y[1]);
    y_next[1] = (~y[0] & ~y[1]) | (~W & y[1]);
end

always @(posedge clk) begin
    if (reset) begin
        y <= 2'b00;
    end else begin
        y <= y_next;
    end
end

always @* begin
    Z <= y[0] & y[1];
end

endmodule
