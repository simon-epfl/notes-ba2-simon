module half_adder(
    input x1,
    input x2,
    output c,
    output f
);

xor (s, x1, x2);
and (c, x1, x2);

endmodule
