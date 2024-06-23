module binary_decoder (
    input [2:0] in,
    output reg [7:0] out
);

always @* begin

    case (in)
        3'b000: out = 00000001;
        3'b001: out = 00000010;
        3'b010: out = 00000100;
        3'b011: out = 00001000;
        3'b100: out = 00010000;
        3'b101: out = 00100000;
        3'b110: out = 01000000;
        3'b111: out = 10000000;
    endcase

end

endmodule
