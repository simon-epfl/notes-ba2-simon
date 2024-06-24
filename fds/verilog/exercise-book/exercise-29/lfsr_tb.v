module lfsr_tb;

reg [0:2] binary_initial = 3'b000;
reg clk = 0;
wire [0:2] out;
reg reset = 1;
reg load = 1;

lfsr l (
    .seed(binary_initial),
    .clk(clk),
    .out(out),
    .load(load),
    .reset(reset)
);

always begin
    #5;
    clk = ~clk;
end

initial begin
    $monitor(out);
    #10
    reset = 0;
    load = 0;
end


endmodule
