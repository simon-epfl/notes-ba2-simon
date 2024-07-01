module two_tb;

reg [7:0] c = 8'b10101111;
reg [7:0] d = 8'b01010101;
wire [7:0] z;

two dut (
    .c(c),
    .d(d),
    .z(z)
);

initial begin
    $monitor("z = %b", z);
end        

endmodule
