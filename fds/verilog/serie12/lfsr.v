module lsfr(
    input reset, clk, load,
    output reg [2:0] Qs
);

parameter [2:0] seed = 3'b001;

reg [2:0] Q_next = 3'b000; // 1, 2, 3

always @* begin
    if (load) Q_next = seed;
    else Q_next = {
        Qs[1],
        Qs[2] ^ Qs[0],
        Qs[2]
    };
    // 110
    // 001
end

always @(posedge clk or posedge reset) begin
    if (reset) Qs <= 3'b000;
    else Qs <= Q_next;
end

endmodule
