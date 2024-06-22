module D_FF (
    input clk,
    input reset,
    input set,
    input D,
    output reg Q,
    output reg Q_n
);

// change output
always @(posedge clk) begin
    Q <= reset ? 0 : (set | D);
end

always @* begin
    Q_n = ~Q;
end

endmodule
