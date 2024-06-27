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

reg a = 1'bx;
reg b = 1'bz;

initial begin

    #10;
    reset = 0;
    #10;/*

    if (dut.current_state != 2'b11) $display("it does not work %b", dut.current_state);
    else $display("it works");*/

    // a && b --> true si les deux sont non nuls
    // a & b --> opération logique AND bit à bit

    $display("%b", !a);

end

always begin
    #5;
    clk = ~clk;
end

endmodule
