module D_FF_tb;

reg clk = 0;
reg reset = 1;
reg set = 0;
reg D = 1;
wire Q;
wire Q_n;

reg expected = 0;

D_FF dff (
    .clk(clk),
    .reset(reset),
    .set(set),
    .D(D),
    .Q(Q),
    .Q_n(Q_n)
);

always #5 clk = ~clk;

task show_result;
    if (Q == expected) begin
        $display("All good");
    end else begin
        $display("Output Q = %b, Expected = %b", Q, expected);
    end
endtask

initial begin

    set = 1;

    // test initial reset
    expected = 0;
    #10;
    show_result();
    
    // test no update between clock updates
    reset = 0;
    D = 1;
    show_result();

    // test update after clock rising
    #20;
    expected = 1;
    show_result(); 

    // test reset priority over set
    reset = 1;
    set = 1;
    expected = 0;
    #20;
    show_result();

    // test set priority over D
    reset = 0;
    set = 1;
    D = 0;
    expected = 1;
    #20;
    show_result();

end

endmodule
