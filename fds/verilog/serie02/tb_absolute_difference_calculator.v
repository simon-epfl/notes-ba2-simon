module tb_absolute_difference_calculator;

    reg [4:0] A;
    reg [4:0] B;
    wire [4:0] result;

    absolute_difference_calculator decoder (
        .A(A),
        .B(B),
        .result(result)
    );

    integer expected;

    initial begin
        /* 
        A = 4'b0110; // Apply input 000
        B = 4'b0010;
        #10; // wait for 10 time units
        if (result != 4'b0100) begin
            $display("Error, wrong input!");
        end */

        for (integer i = 0; i < 4; i = i + 1) begin
            for (integer j = 0; j < 4; j = j + 1) begin
                A = i;
                B = j;
                #10;
                expected = i > j ? i - j : j - i;
                if (result != expected) begin
                    $display("does not work. i [%d], j [%d], expected [%d], result [%d]", i, j, expected, result);
                end else begin
                    $display("[OK] it works. i [%d], j [%d], expected [%d], result [%d]", i, j, expected, result);
                end
            end
        end
    end

endmodule
