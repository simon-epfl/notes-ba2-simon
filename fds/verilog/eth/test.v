module two (input [7:0] c,
            input [7:0] d,
            output reg [7:0] z);
    always @ (c,d) begin
        z      = 8'b11111111;
        //z[7:5] = c[5:3];
        //z[4]   = d[7];
        z[3]   = d[7];
    end
endmodule
