module fsm_tb;

reg clk = 0;
reg reset = 1;
reg W = 1;
wire Z;

fsm my_fsm (
    .clk(clk),
    .reset(reset),
    .W(W),
    .Z(Z)
);

always #5 clk = ~clk;

initial begin

    $monitor(my_fsm.y);

    #10;
    reset = 0;

    #1000;

    $finish;

end

endmodule
