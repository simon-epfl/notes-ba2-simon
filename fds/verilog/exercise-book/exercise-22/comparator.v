module comparator(
    input [4:0] A, B,
    output reg A_eq_B, A_gt_B, A_lt_B
);

    always @(*) begin

        A_eq_B = A == B;
        A_lt_B = A < B;
        A_gt_B = A > B;

    end

endmodule
