module full_adder2 (
    input x, y, cin,
    output s, cout
);

wire intermediate_sum, intermediate_cout, intermediate_sum2, intermediate_cout2;

half_adder ha1 (
    .x(x),
    .y(y),
    .s(intermediate_sum),
    .cout(intermediate_cout)
);

half_adder ha2 (
    .x(cin),
    .y(intermediate_sum),
    .s(s),
    .cout(intermediate_cout2)
);

assign cout = intermediate_cout | intermediate_cout2;

endmodule
