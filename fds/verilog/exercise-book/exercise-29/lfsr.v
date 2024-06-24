module lfsr(
    input [0:2] seed,
    input clk, load, reset,
    output reg [0:2] out
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        out <= reset;
    end else if (load) begin
        out <= seed;
    end else begin
        out[0] <= out[2];
        out[1] <= out[0] ^ out[1];
        out[2] <= out[1];
    end

end

endmodule
