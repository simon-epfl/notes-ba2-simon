module timer_db;

reg clk = 0;
reg reset = 0;
reg in = 1;
wire f;

timer my_timer (
    .clk(clk),
    .reset(reset),
    .in(in),
    .f(f)
);

always #5 clk = ~clk;

initial begin

    $monitor("f = ", f, " next state = ", my_timer.next_state, " timer = ", my_timer.timer);

    #10;
    reset = 1;

    #10000;

    $finish;

end

endmodule
