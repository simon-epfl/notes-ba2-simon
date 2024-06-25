module fsm_tb;

reg clk = 0;
reg reset = 1;
reg W = 1;
wire Z;

fsm dut (
    .clk(clk),
    .reset(reset),
    .W(W),
    .Z(Z)
);

initial begin

    #10;
    reset = 0;
    #10;

    if (dut.current_state != 2'b11) $display("it does not work %b", dut.current_state);
    else $display("it works");

end

always begin
    #5;
    clk = ~clk;
end

endmodule
