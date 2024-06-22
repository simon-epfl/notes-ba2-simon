module test_structural_example;

    // Define three inputs that can procedurally
    // be assigned values.
    reg a, b, c;

    // and one output that responds to them
    wire f;

    // Connect them to an instance of the module being tested
    structural_example ex (.a(a), .b(b), .c(c), .f(f));

    // loop variable
    integer i;

    initial begin
        // write this test's data to a .vcd file
        $dumpfile ("structural_example.vcd");
        $dumpvars;

        // Print values whenever they change
        $monitor ("Time %2t, a=%b, b=%b, c=%b, f=%b", $time, a, b, c, f);

        // exhaust all possible input combinations
        for (i = 0; i < 8; i += 1) begin
            // each variable gets one bit of i
            // first 0, 0, 0
            // then 0, 0, 1
            {a, b, c} = i;
            #1;
        end

        $finish;
    end

endmodule