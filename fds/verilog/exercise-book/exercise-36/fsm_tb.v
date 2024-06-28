module mstb;

reg clk = 0;
reg en = 0;
wire [10:0] out;

mystery_module ms (
    .clk(clk),
    .en(en),
    .out(out)
);

initial begin

    #5;

    $display("out = %d", out);
    #10;
    en = 1;
    $display("out = %d", out);
    #10;
    en = 0;
    $display("out = %d", out);
    #10;
    $display("out = %d", out);

end

always #5 clk = ~clk;

endmodule
