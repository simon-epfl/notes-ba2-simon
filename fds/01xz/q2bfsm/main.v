module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output reg f,
    output reg g
); 
  
    parameter STATE_A = 4'b0000;
    parameter STATE_B = 4'b0001;
    parameter STATE_C1 = 4'b0010;
    parameter STATE_C2 = 4'b0011;
    parameter STATE_D = 4'b0100;
    parameter STATE_E = 4'b0101;
    parameter STATE_F = 4'b0110;
    parameter STATE_G = 4'b0111;
    parameter STATE_IDLE = 4'b1111;
    
    reg [3:0] current_state = STATE_IDLE;
    reg [3:0] next_state;
    
    always @* begin
        next_state = current_state;
        case (current_state)
            STATE_B:
                if (x == 1) next_state = STATE_C1;
            STATE_C1:
                if (x == 0) next_state = STATE_C2;
            STATE_C2:
                case(x)
                    1'b0: next_state = STATE_B;
                    1'b1: next_state = STATE_D;
                endcase
            STATE_D:
                case(y)
                    1'b0: next_state = STATE_E;
                    1'b1: next_state = STATE_G;
                endcase
            STATE_E:
                case(y)
                    1'b0: next_state = STATE_F;
                    1'b1: next_state = STATE_G;
                endcase
            STATE_A: next_state = STATE_B;
            STATE_IDLE: next_state = STATE_A;
            default: next_state = STATE_IDLE;
        endcase
        
    end
    
    always @(posedge clk) begin
        if (!resetn) begin
            current_state <= STATE_IDLE;
        end else begin
            current_state <= next_state;
        end
    end
    
    always @* begin
        f = current_state == STATE_A;
    	g = current_state == STATE_E
            || current_state == STATE_D
            || current_state == STATE_G;
    end
    
    
endmodule
