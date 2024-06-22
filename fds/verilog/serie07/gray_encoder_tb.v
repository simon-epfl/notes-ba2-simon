module gray_encoder_tb;

reg [2:0] in;
reg select;
wire [2:0] out;

gray_encoder encoder (
    .in(in),
    .select(select),
    .out(out)
);

reg [2:0] current;

initial begin
    
    for (integer k = 0; k < 2; k ++) begin
        select = k;
        for (integer i = 0; i < 8; i++) begin
            in = i;
            #10;
            current = i;
            if (select) begin
                // compute the gray code
                current[2] = i[2];
                for (integer j = 1; j >= 0; j--) begin
                    current[j[0]] = i[j+1] ^ i[j];
                end
            end
            if (current == out) begin
                $display("it works (sel = %d)", select);
            end else begin
                $display("pedrone");
            end
        end
    end
    
end

endmodule
