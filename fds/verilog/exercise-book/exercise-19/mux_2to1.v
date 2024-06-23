module mux_2to1(
    input x1,
    input x2,
    input s,
    // output reg f
    output f
);

always @(*) begin
    case (s)
        2'b00: f = x1;
        2'b01: f = x2;
    endcase
end

endmodule
