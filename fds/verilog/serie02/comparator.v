module comparator (
    input [4:0] A, B,
    output reg A_eq_B, A_gt_B, A_lt_B
);

reg x0, x1, x2, x3;

always @* begin

    x0 = (A[0] && B[0]) || (!A[0] && !B[0]);
    x1 = (A[1] && B[1]) || (!A[1] && !B[1]);
    x2 = (A[2] && B[2]) || (!A[2] && !B[2]);
    x3 = (A[3] && B[3]) || (!A[3] && !B[3]);

    A_eq_B = x0 && x1 && x2 && x3;
    A_gt_B = (A[3] && !B[3]) || (x3 && A[2] && !B[2]) || (x3 && x2 && A[1] && !B[1]) || (x3 && x2 && x1 && A[0] && !B[0]);
    A_lt_B = (!A[3] && B[3]) || (x3 && !A[2] && B[2]) || (x3 && x2 && !A[1] && B[1]) || (x3 && x2 && x1 && !A[0] && B[0]);

end

endmodule
