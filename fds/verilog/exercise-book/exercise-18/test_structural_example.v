module test_structural_example;

    // Define three inputs that can procedurally
    // be assigned values.
    reg a, b, c;
    // And one output that responds to them.
    wire f;
    // Connect them to an instance of the module being tested.
    structural_example ex (.a(a), .b(b), .c(c), .f(f));
    // Loop variable.
    integer i;
    initial begin
        // Write this test's data to a .vcd file
        // that GTKWave can read.
        $dumpfile ("structural_example.vcd");
        $dumpvars;
        // Print values whenever they change.
        $monitor ("Time %2t, a=%b, b=%b, c=%b, f=%b",
        $time, a, b, c, f);
        // Exhaust all input combinations,
        // each time followed by a delay of 1 time unit.
        for (i = 0; i < 8; i += 1) begin
            // Each variable gets one bit from i.
            // First 0, 0, 0
            // then 0, 0, 1, etc.
            {a, b, c} = i;
            #1;
        end
        // Done.
        $finish;
    end

endmodule
