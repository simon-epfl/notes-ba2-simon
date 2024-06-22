module full_adder1 (
    input x, y, cin,
    output s, cout
);

wire p1, p2, p3;

assign p1 = x ^ y;
assign p2 = x & y;
assign p3 = cin & p1;

assign s = cin ^ p1;
assign cout = p3 | p2;

endmodule