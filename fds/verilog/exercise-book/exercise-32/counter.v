module counter(
    input reset, clk, enable,
    output reg [2:0] out
);

always @(posedge clk) begin
    if (reset) out <= 0;
    else if (enable) begin
        if (out == 3'b101) begin
            out <= 0;
        end else begin
            out <= out + 1;
        end
    end
end

endmodule
