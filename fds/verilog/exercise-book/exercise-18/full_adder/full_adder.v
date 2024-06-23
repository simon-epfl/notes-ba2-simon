module full_adder2 (
    input x,
    input y,
    input cin,
    output s,
    output cout
);

wire tmp_cout;
wire tmp_2_cout;

half_adder ha (
    .x1(x),
    .x2(y),
    .s(tmp_sum),
    .c(tmp_cout)
);

half_adder ha2 (
    .x1(tmp_sum),
    .x2(cin),
    .s(s),
    .c(tmp_2_cout)
);

assign cout = tmp_cout || tmp_2_cout;

endmodule
