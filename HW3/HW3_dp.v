////////////////////////////////////////////////////////////////
//
// Module: HW3_dp.v
// Author: Myles Johnson
// mylesjohnson15@ucla.edu
//
// Description:
// FSM for HW3
//
// Parameters:
// S0, S1, S2, S3, S4, S5, S6, S7
// Inputs:
// CLK, RESET, DATA
// Outputs:
// FIND
////////////////////////////////////////////////////////////////
module HW3_dp (i_clk, i_rst_n, i_data, o_find);
////////////////////////////////////////////////////////////////
parameter [2:0] S0 = 3'b000, // State 0
                S1 = 3'b001, // State 1
                S2 = 3'b010, // State 2
                S3 = 3'b011, // State 3
                S4 = 3'b100, // State 4
                S5 = 3'b101, // State 5
                S6 = 3'b110, // State 6
                S7 = 3'b111; // State 7

input i_clk; // CLK signal
input i_rst_n; // reset pin
input i_data; // input data
output reg o_find; // output "1" = HI if pattern found else "0" = LO

reg[2:0] state, next; 
  
//Present State FF Block
always @(posedge i_clk)
    if(i_rst_n)
      state <= S0;
  	else
      state <= next;
    
//Next State Logic Block, based of State Diagram
always @(i_data or state)
    begin
      case(state)
        S0: if (i_data) next = S1;
        	else next = S0;
        S1: if (i_data) next = S2;
        	else next = S0;
        S2: if (i_data) next = S2;
        	else next = S3;
        S3: if (i_data) next = S4;
        	else next = S0;
        S4: if (i_data) next = S5;
        	else next = S0;
        S5: if (i_data) next = S2;
        	else next = S6;
        S6: if (i_data) next = S7;
        	else next = S0;
        S7: if (i_data) next = S5;
        	else next = S0;
      endcase
    end
  
//Output Logic Block
always @(state)
    if (i_rst_n)
      o_find <= 0;
    else 
    case(state)
      S0: o_find <= 0;
      S1: o_find <= 0;
      S2: o_find <= 0;
      S3: o_find <= 0;
      S4: o_find <= 0;
      S5: o_find <= 0;
      S6: o_find <= 0;
      S7: o_find <= 1;
      default: o_find <= 0;
    endcase
endmodule 
        