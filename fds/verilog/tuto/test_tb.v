module test_tb;

    reg a = 0;
    reg b = 0;
    reg c = 0;
    wire F;

    structural_example my_test (
        .a(a),
        .b(b),
        .c(c),
        .f(f)
    );

endmodule
