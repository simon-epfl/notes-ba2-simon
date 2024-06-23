module absolute_difference_calculator_tb;

reg A = 4'b0000;
reg B = 4'b0000;
wire result;

absolute_difference_calculator ab (
    .A(A),
    .B(B),
    .result(result)
);

initial begin

    for (integer i = 0; i < 16; i++) begin
        A = i;
        for (integer j = 0; j < 16; j++) begin
            B = j;
            if (result != (A > B ? A-B : B-A)) begin
                $display("Wrong.");
            end else begin
                $display("Great.");
            end
        end
    end

end

endmodule
