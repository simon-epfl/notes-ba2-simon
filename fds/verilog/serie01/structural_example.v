module structural_example (
    // Three input signals.
    input a,
    input b,
    input c,
    // One output signal.
    output f
);

    // One intermediate wire.
    wire p;

    // Two gates specifying name, output, and inputs.
    and g1 (p, a, b);
    or g2 (f, p, c);

endmodule
