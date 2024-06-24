module counter(clk, reset, out);

input clk;
input reset;
parameter size = 12;
output reg [size-1:0] out;
reg [size-1:0] value;

always @(posedge clk) begin
    if (reset) begin
        value = 0;
    end else value <= value + 1;
end

always @* begin
    out <= value[size-1];
end

endmodule
