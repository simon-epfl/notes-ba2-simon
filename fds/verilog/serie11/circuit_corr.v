module mem (clock, addr, we, data_in, data_out);

    // le nombre de bits de chaque entrée mémoire
    parameter Ndb = 8;
    // le nombre d'entrées mémoires
    parameter Ndw = 8;

    // l'adresse dans laquelle on veut lire/écrire
    input [Ndw-1:0] addr;

    input clock, we;
    input [Ndb-1:0] data_in;
    output reg [Ndb-1:0] data_out;

    reg [Ndb-1:0] mem [2**Ndw-1:0];

    // gestion de l'écriture et de l'output (synchrones)
    always @(posedge clock) begin
        if (we) begin
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
    // State definitions
    parameter READA = 2'b00;
    parameter COMP  = 2'b01;
    parameter HALT  = 2'b10;
    // Wire and register definitions
    reg [2:0] AddrA;
    reg [1:0] AddrB;
    wire [7:0] DOut1;
    reg [7:0] DOut2;
    reg [7:0] DataInB;
    reg [7:0] ADDOut;
    reg [7:0] SUBOut;
    reg Sign;
    reg IncA;
    reg IncB;
    reg WEA;
    reg WEB;
    reg [1:0] state;
    reg [1:0] next_state;

    // Memory A
    mem #(.Ndw(3), .Ndb(8)) MemoryA (
        .clock(clock),
        .addr(AddrA),
        .data_in(DataInA),
        .we(WEA),
        .data_out(DOut1)
    );
    // Memory B
    mem #(.Ndw(2), .Ndb(8)) MemoryB (
        .clock(clock),
        .addr(AddrB),
        .data_in(DataInB),
        .we(WEB)
    );

    // State transition logic
    always @(*) begin
        // Initialize
        next_state = state;
        // Assign
        case (state)
            READA:
            if (Init) next_state = READA;
            else if (AddrA == 7)
            next_state = COMP;
            else
            next_state = READA;
            COMP:
            if (Init) next_state = READA;
            else if (AddrA == 0 && AddrB == 3)
            next_state = HALT;
            else
            next_state = COMP;
            HALT:
            if (Init) next_state = READA;
            else next_state      = HALT;
            default:
            next_state = HALT;
        endcase
    end

    // State assignment logic
    always @(posedge clock or posedge Reset) begin
        if (Reset) state <= READA;
        else state       <= next_state;
    end

    // Controller output logic
    always @(*) begin
        // Initialize
        WEA  = 0;
        IncA = 0;
        WEB  = 0;
        IncB = 0;
        // Assign
        case (state)
            READA: begin
                // Write and increment A
                WEA  = 1;
                IncA = 1;
                WEB  = 0;
                IncB = 0;
            end
            COMP: begin
                // Never write to A
                WEA = 0;
                // Increment A until we finish reading
                // i.e. check if AddrA wrapped around
                if (AddrA == 0 && AddrB == 3)
                    IncA = 0;
                else
                    IncA = 1;
                    // Write and increment B every 2 cycles
                    // i.e. check the last bit of AddrA
                    // and dont write and increment in the first cycle
                    if (AddrA[0] == 0 && !(AddrA == 0
                    && AddrB == 0)) begin
                    WEB  = 1;
                    IncB = 1;
                    end else begin
                    WEB  = 0;
                    IncB = 0;
            end
        end
        HALT: begin
            // Halt and do nothing
            WEA  = 0;
            IncA = 0;
            WEB  = 0;
            IncB = 0;
        end
        default: begin
            WEA  = 0;
            IncA = 0;
            WEB  = 0;
            IncB = 0;
        end
        endcase
    end

    // Counter logic for AddrA
    always @(posedge clock or posedge Reset) begin
        if (Reset) AddrA     <= 0;
        else if (Init) AddrA <= 0;
        else if (IncA) AddrA <= AddrA + 1;
    end

    // Counter logic for AddrB
    always @(posedge clock or posedge Reset) begin
        if (Reset) AddrB     <= 0;
        else if (Init) AddrB <= 0;
        else if (IncB) AddrB <= AddrB + 1;
    end

    // DOut2 logic
    always @(posedge clock or posedge Reset) begin
        if (Reset) DOut2     <= 0;
        else if (Init) DOut2 <= 0;
        else DOut2           <= DOut1;
    end

    // Data processing logic
    always @(*) begin
        // Initialize
        ADDOut  = 0;
        SUBOut  = 0;
        Sign    = 0;
        DataInB = 0;
        // Assign
        ADDOut            = DOut2 + DOut1;
        SUBOut            = DOut2 - DOut1;
        Sign              = DOut2 <= DOut1;
        if (Sign) DataInB = ADDOut;
        else DataInB      = SUBOut;
    end

endmodule
