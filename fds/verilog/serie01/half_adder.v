module half_adder 
(
    input x, y,
    output s, cout
);

assign s = y ^ x;
assign cout = y & x;

endmodule
