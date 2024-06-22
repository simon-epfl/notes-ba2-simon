module memProcessingTB ();
    
    reg clk;
    reg [7:0] DataInA;
    reg reset;
    reg Init;

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    memProcessing uut (
        .clock(clk),
        .Reset(reset),
        .Init(Init),
        .DataInA(DataInA)
    );

    initial begin
        $dumpfile("memProcessingTB.vcd");
        $dumpvars(0, memProcessingTB);

        DataInA = 0;
        reset = 1;
        Init = 1;
        #10 reset = 0;
        #2 Init = 0;
        #2 DataInA = 1;
        #2 DataInA = 2;
        #2 DataInA = 3;
        #2 DataInA = 7;
        #2 DataInA = 6;
        #2 DataInA = 5;
        #2 DataInA = 4;
        // Setting Init to 1 to check the state returns to READA from HALT
        #80 Init = 1;
        #50

        // check if it is correct
        if (uut.MemoryB.mem[0] == 1 && uut.MemoryB.mem[1] == 5 && uut.MemoryB.mem[2] == 1 && uut.MemoryB.mem[3] == 1) begin
            $display("Test passed");
        end else begin
            $display("Test failed");
            $display("Expected: 1 5 1 1");
            $display("Actual: %d %d %d %d", uut.MemoryB.mem[0], uut.MemoryB.mem[1], uut.MemoryB.mem[2], uut.MemoryB.mem[3]);
        end
        $finish;
    end
endmodule
