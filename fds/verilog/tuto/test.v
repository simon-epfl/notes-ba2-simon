module bus(
    input [2:0] a, b, c, // 001, 001
    input enable_a, enable_b, enable_c,
    output [2:0] f
);

always @* begin
    f = enable_a ? a : enable_b ? b : enable_c ? c : z;
end

endmodule
