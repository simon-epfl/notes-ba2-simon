module absolute_difference_calculator(
    input [0:4] A, B,
    output result
);

wire A_eq_B;
wire A_lt_B;
wire A_gt_B;

comparator comp (
    .A(A),
    .B(B),
    .A_eq_B(A_eq_B),
    .A_gt_B(A_gt_B),
    .A_lt_B(A_lt_B)
);

assign result = A_gt_B ? A - B : B - A;

endmodule
