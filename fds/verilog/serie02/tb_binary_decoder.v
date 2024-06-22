module tb_binary_decoder;

    reg [2:0] in;
    wire [7:0] out;

    binary_decoder decoder (
        .in(in),
        .out(out)
    );

    initial begin
        /* 
        in = 3'b000; // Apply input 000
        #10; // wait for 10 time units
        if (out != 8'b00000001) begin
            $display("Error, wrong input!");
        end
        */
        for (integer i = 0; i < 8; i = i + 1) begin
            in = i;
            #10;
            if (out != 8'b1 << i) begin
                $display("[%d] Error! Wrong Output!", i);
            end else begin
                $display("[%d] Correct Output!", i);
            end
        end
    end

endmodule
