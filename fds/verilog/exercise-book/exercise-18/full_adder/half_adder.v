module half_adder (
    input x1,
    input x2,
    output s,
    output c
);

assign s = x1 ^ x2;
assign c = x1 && x2;

endmodule
