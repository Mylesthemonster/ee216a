////////////////////////////////////////////////////////////////
//
// Module: HW3_dp_tb.v
// Author: Myles Johnson
// mylesjohnson15@ucla.edu
//
// Description:
// FSM Testbench for HW3
//
// Inputs:
// CLK, RESET, DATA
// Outputs:
// FIND
////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module HW3_dp_tb();

// Inputs
reg             clk;
reg             reset;
reg     		data;
// Outputs
wire            find;

// Instantiate a Design Under Test (DUT)
HW3_dp dp_0(
    .i_clk      (clk),
    .i_rst_n    (reset),
    .i_data     (data),
    .o_find     (find));

// Oscillate the clock (cycle time is 10ns)
always #5 clk = ~clk;

initial
    begin
      clk = 0;
      reset = 0;
      data = 0;
      
      //reset FSM first
      reset = 1;
      #10 reset = 0;

      // Binary Input seqeunce 
      $display("Inputing Sequence: 0000001101101101101111111\n");
      $monitor("Find: %d", find); // Continuously Output Find to see if pattern found
      
      //sequence of 0's
      #10 data = 0;
      #10 data = 0;
      #10 data = 0;
      #10 data = 0;
      #10 data = 0;
      #10 data = 0;
      
      // 3 overlaping sequences of "1101101"
      #10 data = 1;
      #10 data = 1;
      #10 data = 0;
      #10 data = 1;
      #10 data = 1;
      #10 data = 0;
      #10 data = 1;
      #10 data = 1;
      #10 data = 0;
      #10 data = 1;
      #10 data = 1;
      #10 data = 0;
      #10 data = 1;
   
      //sequence of 1's
      #10 data = 1;
      #10 data = 1;
      #10 data = 1;
      #10 data = 1;
      #10 data = 1;
      #10 data = 1;
   
      #20 $finish;
    end
endmodule