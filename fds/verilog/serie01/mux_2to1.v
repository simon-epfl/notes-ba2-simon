module mux_2to1 (
    input x1, x2, s,
    output reg f
);

always @* begin
    f = s == 0 ? x1 : x2;
end

endmodule
