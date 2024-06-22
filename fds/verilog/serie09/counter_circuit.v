module counter_circuit(
	input clk,
	input clr,
	output reg [3:0] X,
	output reg [3:0] Y
);

always @(posedge clk) begin

	X <= clr ? 0 : X == 9 ? 0 : X + 1;
	Y <= clr ? 0 : X == 0 ? Y == 9 ? 0 : Y + 1 : Y;

end


endmodule;
