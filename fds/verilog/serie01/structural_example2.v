module structural_example (
    // Three input signals.
    input a,
    input b,
    input c,
    // One output signal.
    output f
);

    wire p1;
    wire p2;
    wire not_a; // Declaration of wire without initial assignment
    wire not_b; // Declaration of wire without initial assignment

    // Inverting a and b.
    not g0 (not_a, a);
    not g0_1 (not_b, b);

    // Two gates specifying name, output, and inputs.
    nor g3 (f, p1, p2);
    and g2 (p1, not_a, b);
    and g1 (p2, not_b, c);

endmodule
