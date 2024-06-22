module gray_encoder
(
    input [2:0] in,
    input select,
    output reg [2:0] out
);

always @* begin

    if (select) begin

        case (in)
            3'b000: out = 3'b000;
            3'b001: out = 3'b001;
            3'b010: out = 3'b011;
            3'b011: out = 3'b010;
            3'b100: out = 3'b110;
            3'b101: out = 3'b111;
            3'b110: out = 3'b101;
            3'b111: out = 3'b100;
        endcase

    end else begin
        out = in;
    end

end

endmodule
