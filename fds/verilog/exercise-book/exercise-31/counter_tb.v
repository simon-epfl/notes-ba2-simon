module counter_tb;

reg clk, reset;
wire [11:0] out;

integer expected;

counter #(.size(12)) dut (
    .clk(clk),
    .reset(reset),
    .out(out)
);

initial begin

    clk = 0;
    reset = 1;
    #10; // wait 1 clock cycle
    reset = 0;

    for(integer i = 0; i < 10000; i++) begin
        #10; // wait 1 clock cycle
        expected = (i % 4096) < 2048 ? 0 : 1;
        if (expected != out) begin
            //$display("error got [%b], expected [%b] value", out, expected);
        end else begin
            $display("correct got [%b], expected [%b] value", out, expected);
        end
    end

end

always begin
    #5;
    clk = ~clk;
end

endmodule
