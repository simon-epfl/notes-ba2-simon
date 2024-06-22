module lsfr_tb;

reg reset = 0;
reg load = 1;
reg clk = 0;
wire [2:0] Qs;

lsfr my_lsfr (
    .reset(reset),
    .clk(clk),
    .Qs(Qs),
    .load(load)
);

always begin
    #5;
    clk = ~clk;
end

initial begin

    #10;
    load = 0;
    reset = 0;
    #100;
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);
    #10;
    $display(Qs);

end

endmodule
