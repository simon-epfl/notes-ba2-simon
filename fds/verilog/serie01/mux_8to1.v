module mux_8to1 (
    input [2:0] x1,
    input [2:0] x2,
    input [2:0] x3,
    input [2:0] x4,
    input [2:0] x5,
    input [2:0] x6,
    input [2:0] x7,
    input [2:0] x8,
    input [2:0] s,
    output reg [2:0] f
);

always @* begin

    case (s)
        3'b001: f = x1;
        3'b010: f = x2;
        3'b011: f = x3;
        3'b100: f = x4;
        3'b100: f = x5;
        3'b101: f = x6;
        3'b110: f = x7;
        3'b111: f = x8;
    endcase

end

endmodule
