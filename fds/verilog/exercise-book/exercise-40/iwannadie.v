module mem (addr_to_read_write, data_in, write_enabled, clock, data_out);

    parameter Nawidth = 3; // address width
    parameter Ndwidth = 8; // data width

    reg [Ndwidth-1:0] mem [2**Nawidth-1:0];

    input write_enabled, clock;
    
    input [Nawidth-1:0] addr_to_read_write;
    input [Ndwidth-1:0] data_in;

    output reg [Ndwidth-1:0] data_out;

    always @(posedge clock) begin

        if (write_enabled) begin
            $display(addr_to_read_write);
            $display(data_in);
            mem[addr_to_read_write] <= data_in;
        end

        data_out <= mem[addr_to_read_write];

    end

endmodule

module memProcessing (
    input clock,
    input Reset,
    input Init,
    input [7:0] DataInA
);

reg [2:0] addr_A_to_read_write;
reg [1:0] addr_B_to_read_write;

reg [7:0] data_to_write_to_B;

reg incA;
reg incB;

reg weA = 0;
reg weB = 0;

wire [7:0] d_out_1;
reg [7:0] d_out_2;

reg [7:0] add_out;
reg [7:0] sub_out;

reg sign;


mem #(.Nawidth(3), .Ndwidth(8)) memoryA (
    .addr_to_read_write(addr_A_to_read_write),
    .data_in(DataInA),
    .write_enabled(weA),
    .clock(clock),
    .data_out(d_out_1)
);

mem #(.Nawidth(2), .Ndwidth(8)) memoryB (
    .addr_to_read_write(addr_B_to_read_write),
    .data_in(data_to_write_to_B),
    .write_enabled(weB),
    .clock(clock)
);

reg [7:0] DataInB;

parameter READA = 2'b00;
parameter COMP = 2'b01;
parameter HALT = 2'b10;

reg [1:0] current_state;
reg [1:0] next_state;

// compute the next state
always @* begin

    next_state = current_state;

    case (current_state)

        READA:
            if (Init) next_state = READA;
            else if (addr_A_to_read_write == 7) begin // we are at the end of the reading of the data in a
                next_state = COMP;
            end else begin
                next_state = READA;
            end

        COMP:
            if (Init) next_state = READA;
            else if (
                addr_A_to_read_write == 0
                && addr_B_to_read_write == 3
            ) begin
                next_state = HALT;
            end else begin
                next_state = COMP;
            end
        
        HALT:
            if (Init) next_state = READA;
            else next_state = HALT;
        
        default: next_state = HALT;

    endcase

end

// assign the next state
always @(posedge clock or posedge Reset) begin
    if (Reset) current_state <= READA;
    else current_state <= next_state;
end

// controller 
always @* begin

    weA = 0;
    weB = 0;
    incA = 0;
    incB = 0;

    case (current_state)

        READA: begin
            weA = 1;
            incA = 1;
            weB = 0;
            incB = 0;
        end

        COMP: begin
            // Never write to A
            weA = 0;
            // Increment A until we finish reading
            // i.e. check if AddrA wrapped around
            if (addr_A_to_read_write == 0 && addr_B_to_read_write == 3) begin
                incA = 0;
            end
            else begin
                incA = 1;
            end
            // Write and increment B every 2 cycles
            // i.e. check the last bit of AddrA
            // and dont write and increment in the first cycle
            if (addr_A_to_read_write[0] == 0 && !(addr_A_to_read_write == 0 && addr_B_to_read_write == 0)) begin
                weB  = 1;
                incB = 1;
            end else begin
                weB  = 0;
                incB = 0;
            end
        end

        HALT: begin
            weA = 0;
            incA = 0;
            weB = 0;
            incB = 0;
        end

        default: begin
            weA = 0;
            incA = 0;
            weB = 0;
            incB = 0;
        end

    endcase

    // if (Init) begin
    //     current_state <= READA;
    //     counterA <= 0;
    //     counterB <= 0;
    // end else begin

    //     if (current_state == READA && counterA != 7) begin
    //         incA = 1;
    //         weA = 1;
    //     end else if (current_state == READA && counterA == 7) begin
    //         weA = 0;
    //     end else if (current_state == COMP && counterB != 3) begin
    //         incB = counterA > 1 && counterA % 2 == 0;
    //         weB = incB;
    //     end else if (current_state == COMP && counterB == 3) begin
    //         current_state = HALT;
    //     end

    //     current_state <= next_state;

    // end

end

always @(posedge clock or posedge Reset) begin

    if (Reset) addr_A_to_read_write <= 0;
    else if (Init) addr_A_to_read_write <= 0;
    else if (incA) addr_A_to_read_write <= addr_A_to_read_write + 1;

end

always @(posedge clock or posedge Reset) begin

    if (Reset) addr_B_to_read_write <= 0;
    else if (Init) addr_B_to_read_write <= 0;
    else if (incB) addr_B_to_read_write <= addr_B_to_read_write + 1;

end

always @(posedge clock or posedge Reset) begin

    if (Reset) d_out_2 <= 0;
    else if (Init) d_out_2 <= 0;
    else d_out_2 <= d_out_1;

end

always @* begin

    add_out = 0;
    sub_out = 0;
    sign = 0;
    data_to_write_to_B = 0;

    add_out = d_out_2 + d_out_1;
    sub_out = d_out_2 - d_out_1;
    sign = d_out_2 <= d_out_1;

    if (sign) data_to_write_to_B = add_out;
    else data_to_write_to_B = sub_out;

end

endmodule
