////////////////////////////////////////////////////////////////
//
// Module: HW2_alu.v
// Author: Myles Johnson
// mylesjohnson15@ucla.edu
//
// Description:
// ALU for HW2
//
// Parameters:
//
// Inputs:
// CLK, RESET, DATA_A, DATA_B, INST
// Outputs:
// DATA_O
////////////////////////////////////////////////////////////////
module HW2_alu (clk_p_i,reset_n_i,data_a_i,data_b_i,inst_i,data_o);
////////////////////////////////////////////////////////////////
// Inputs & Outputs
input clk_p_i;
input reset_n_i;
input [7:0] data_a_i;
input [7:0] data_b_i;
input [2:0] inst_i;
output [15:0] data_o;
////////////////////////////////////////////////////////////////
// reg & wire declarations
wire [15:0] out_inst_0; // Wire carrys output when inst_1 casevalue equals 0
wire [15:0] out_inst_1; // Wire carrys output when inst_1 casevalue equals 1
wire [15:0] out_inst_2; // Wire carrys output when inst_1 casevalue equals 2
wire [15:0] out_inst_3; // Wire carrys output when inst_1 casevalue equals 3
wire [15:0] out_inst_4; // Wire carrys output when inst_1 casevalue equals 4
wire [15:0] out_inst_5; // Wire carrys output when inst_1 casevalue equals 5
wire [15:0] out_inst_6; // Wire carrys output when inst_1 casevalue equals 6
wire [15:0] out_inst_7; // Wire carrys output when inst_1 casevalue equals 7
reg [15:0] ALU_out_inst; // Register that holds output of chosen ALU function
wire [15:0] ALU_d2_w; // Wire that carries output of ALU
reg [15:0] ALU_d2_r; // Register that holds ALU out info
reg [7:0] Data_A_o_r; // Register that holds Data A
reg [7:0] Data_B_o_r; // Register that holds Data B
reg [2:0] Inst_o_r; // Register that holds Instruction Value
////////////////////////////////////////////////////////////////
// Combinational Logic
assign ALU_d2_w = ALU_out_inst;
assign data_o = ALU_d2_r;
// The output MUX
always @(*) begin
case(inst_i)
3 'b000: ALU_out_inst = Data_A_o_r + Data_B_o_r; // Unsigned Addition
3 'b001: ALU_out_inst = Data_A_o_r - Data_B_o_r; // Unsigned Subtraction
3 'b010: ALU_out_inst = Data_A_o_r * Data_B_o_r; // Unsigned Multiplication
3 'b011: ALU_out_inst = Data_A_o_r & Data_B_o_r; // Bitwise AND
3 'b100: ALU_out_inst = Data_A_o_r ^ Data_B_o_r; // Bitwise XOR
3 'b101: ALU_out_inst = Data_A_o_r[7] ? -Data_A_o_r : Data_A_o_r; // |a| --> If MSB of a is 1 (neg) flip sign else stay keep pos value
3 'b110: ALU_out_inst = ((Data_A_o_r - Data_B_o_r) << 2); // Subtract and mulpily by 4 (left shift by 2 which is multiply by 2^2 = 4)
3 'b111: ALU_out_inst = {(16){1'b0}}; // Unused Case
default: ALU_out_inst = {(16){1'b0}}; // Default case
endcase
end
////////////////////////////////////////////////////////////////
// Registers
always @(posedge clk_p_i or negedge reset_n_i) begin
if (reset_n_i == 1'b0) begin
ALU_d2_r <= {(16){1'b0}};
Data_A_o_r <= {(8){1'b0}};
Data_B_o_r <= {(8){1'b0}};
Inst_o_r <= 3'b111;
end
else begin
ALU_d2_r <= ALU_d2_w;
Data_A_o_r <= data_a_i;
Data_B_o_r <= data_b_i;
Inst_o_r <= inst_i;
end
end
endmodule
