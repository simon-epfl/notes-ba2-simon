module gray_encoder_tb;

reg binary_in = 3'b000;
reg select = 1;
wire out;

gray_encoder ge (
    .binary_in(binary_in),
    .select(select),
    .out(out)
);

initial begin

    for (integer i = 0; i < 8; i++) begin
        binary_in = i;
        if (out != binary_in) begin
            $display("[%b] Error! Wrong Output!", binary_in);
        end else begin
            $display("[%b] Correct Output!", binary_in);
        end
    end

end

endmodule
