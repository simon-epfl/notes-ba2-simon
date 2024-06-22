module memory (clk, addr, write_enabled, data_in, data_out);

    // le nombre de bits de chaque entrée mémoire
    parameter Ndb = 8;
    // le nombre d'entrées mémoires
    parameter Ndw = 8;

    // l'adresse dans laquelle on veut lire/écrire
    input [Ndw-1:0] addr;

    input clk, write_enabled;
    input [Ndb-1:0] data_in;
    output reg data_out;

    reg [Ndb-1:0] mem [Ndw-1:0];

    // gestion de l'écriture et de l'output (synchrones)
    always @(posedge clk) begin
        if (write_enabled) begin
            mem[addr] = data_in;
        end
        data_out <= mem[addr];
    end

endmodule

module memProcessing (
    input clock,
    input Reset,
    input Init,
    input [7:0] DataInA
);

wire data_out_1;
reg data_out_2;

reg [1:0] state;
reg [1:0] next_state;

reg [7:0] ADDOut;
reg [7:0] SUBOut;
reg Sign;

reg WEA;
reg WEB;

reg incA;
reg incB;

parameter NdbA = 8;
parameter NdwA = 8;
reg [NdwA-1:0] addrA;
memory #(.Ndb(NdbA), .Ndw(NdwA)) MemoryA (.clk(clk), .addr(addrA), .write_enabled(WEA), .data_in(DataInA), .data_out(data_out_1));

parameter NdbB = 8;
parameter NdwB = 4;
reg [NdwB-1:0] addrB;
reg [NdbB-1:0] data_in_b;
memory #(.Ndb(NdbB), .Ndw(NdwB)) MemoryB (.clk(clk), .addr(addrB), .write_enabled(WEB), .data_in(data_in_b));

parameter STATE_READA = 2'b00, STATE_COMP = 2'b01, STATE_HALT = 2'b10;

always @(*) begin

    WEA = 0;
    incA = 0;
    WEB = 0;
    incB = 0;

    case (state)
        
        STATE_READA: begin
            if (addrA == 7 & !Init) next_state = STATE_COMP;
            else next_state = STATE_READA;

            WEA = 1;
            incA = 1;
        end

        STATE_COMP: begin
            if (Init) next_state = STATE_READA;
            else if (addrA == 0 & addrB == 3) next_state = STATE_HALT;
            else begin
                next_state = STATE_COMP;

                incA = 1;
                if (addrA[0] == 0) begin
                    incB = 1;
                    WEB = 1;
                end else begin
                    incB = 0;
                    WEB = 0;
                end
            end
            
        end

        STATE_HALT: begin
            if (Init) next_state = STATE_HALT;
            else next_state = STATE_READA;

            WEA = 0;
            WEB = 0;
        end

    endcase

end

// Counter logic for addrA
always @(posedge clock or posedge Reset) begin
    if (Reset) addrA <= 0;
    else if (Init) addrA <= 0;
    else if (incA) addrA <= addrA + 1;
end

// Counter logic for addrB
always @(posedge clock or posedge Reset) begin
    if (Reset) addrB <= 0;
    else if (Init) addrB <= 0;
    else if (incB) addrB <= addrB + 1;
end

// data_out_2 logic
always @(posedge clock or posedge Reset) begin
    if (Reset) data_out_2 <= 0;
    else if (Init) data_out_2 <= 0;
    else data_out_2 <= data_out_1;
end

always @(posedge clock or posedge Reset) begin
    if (Reset) state <= STATE_READA;
    else state <= next_state;
end

always @(*) begin

    // Initialize
    ADDOut = 0;
    SUBOut = 0;
    Sign = 0;
    data_in_b = 0;
    // Assign
    ADDOut = data_out_2 + data_out_1;
    SUBOut = data_out_2 - data_out_1;
    Sign = data_out_2 <= data_out_1;

    if (Sign) data_in_b = ADDOut;
    else data_in_b = SUBOut;
end

endmodule
