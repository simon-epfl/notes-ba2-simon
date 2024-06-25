module counter_tb ();

    reg reset = 1;
    reg clk = 0;
    reg enable = 1;
    integer expected = 0;

    wire [2:0] out;

    counter dut (
        .reset(reset),
        .clk(clk),
        .enable(enable),
        .out(out)
    );

    initial begin

        #10; // one clock cycle
        reset = 0;

        for (integer i = 1; i < 10000; i++) begin
            #10;
            expected = (i % 6);
            if (out == expected) $display("it works!");
            else $display("does not work!");
        end

    end

    always begin
        #5;
        clk = ~clk;
    end

endmodule
