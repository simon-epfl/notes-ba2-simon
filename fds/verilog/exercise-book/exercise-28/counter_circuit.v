module counter_circuit(
    input clk,
    input clr,
    output reg [3:0] X,
    output reg [3:0] Y
);

    always @(posedge clk) begin

        if (clr) begin
            X = 0;
            Y = 0;
        end else if (Y == 9 && X == 9) begin
            Y = 0;
            X = 0;
        end else if (X == 9) begin
            Y += 1;
            X = 0;
        end else begin
            X += 1;
        end

    end

endmodule
