module D_FF (
    input clk,
    input reset,
    input set,
    input D,
    output reg Q,
    output reg Q_n
);

    always @(posedge clk) begin
        if (reset) begin
            Q <= 0;
        end else if (set) begin
            Q <= 1'b01;
        end else begin
            Q <= D;
        end
    end

    always @* begin
        Q_n = ~Q;
    end

endmodule
