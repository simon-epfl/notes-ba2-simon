module absolute_difference_calculator (
    input [4:0] A, B,
    output [4:0] result
);

wire A_eq_B, A_gt_B, A_lt_B;

comparator comp(.A(A), .B(B), .A_eq_B(A_eq_B), .A_gt_B(A_gt_B), .A_lt_B(A_lt_B));

assign result = A_eq_B ? 0 : A_gt_B ? A - B : B - A;

endmodule

