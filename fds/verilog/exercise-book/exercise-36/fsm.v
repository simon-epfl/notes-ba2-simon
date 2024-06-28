module mystery_module (clk,
                       en,
                       out);
    
    input clk, en;
    reg [63:0] in1 = 64'h0807060504030201;
    reg [7:0] in2 = 8'b10111011;
    output reg[10:0] out = 0;
    
    reg[2:0] var1 = 0;
    
    always @(posedge clk) begin
        //out <= out;
        if (en & (var1 == 0)) begin
            var1 <= var1 + 1'b1;
            
            if (in2[var1])
                out <= 11'd0 + in1[var1*8 +: 8];
            else
                out <= 11'd0 - in1[var1*8 +: 8];
        end
        
        if (var1 != 0) begin
            var1 <= var1 + 1'b1;
            
            if (in2[var1])
                out <= out + in1[var1*8 +: 8];
            else
                out <= out - in1[var1*8 +: 8];
        end
    end

    always @*
        $display("out from inside = %d", out);
    
endmodule
