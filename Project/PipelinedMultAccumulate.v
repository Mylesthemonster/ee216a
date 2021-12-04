`timescale 1ns/100ps

module PipelinedMultAccumulate#(parameter NUM_INPUTS=4)(IN_PIXELS, IN_WEIGHTS, OUT, done, clk, rst);
parameter PIXEL_WIDTH = 10; //10-0 (int-deci)
parameter WEIGHT_WIDTH = 19; //1-18
parameter OUTPUT_WIDTH = 26; //8-18
input [NUM_INPUTS*PIXEL_WIDTH-1:0] IN_PIXELS;
input [NUM_INPUTS*WEIGHT_WIDTH-1:0] IN_WEIGHTS;
input clk;
input rst;
output [OUTPUT_WIDTH-1:0] OUT;
output done;
reg [9:0] step; //make sure this is wide enough to fit number of inputs

reg [OUTPUT_WIDTH-1:0] out_buf;
wire [OUTPUT_WIDTH-1:0] mult_output;
wire [WEIGHT_WIDTH-1:0] current_weight;
wire [PIXEL_WIDTH-1:0] current_pixel;

assign done = step > NUM_INPUTS + 5;
assign OUT = out_buf;
assign current_weight = (step < NUM_INPUTS) ? IN_WEIGHTS[(step)*WEIGHT_WIDTH +: WEIGHT_WIDTH] : 0;
assign current_pixel = (step < NUM_INPUTS) ? IN_PIXELS[(step)*PIXEL_WIDTH +: PIXEL_WIDTH] : 0;


FixedPointMultiplier mult_0(
  .clk(clk),
  .GlobalReset(rst),
  .WeightPort(current_weight), // sfix19_En18
  .PixelPort(current_pixel), // sfix10_En0
  .Output_syn(mult_output) // sfix26_En18
);

always@(posedge clk) begin
	if (rst) begin
    step <= 0;
    out_buf <= 0;
  end else begin
    out_buf <= mult_output + out_buf;
    step <= step + 1;
  end
end

endmodule
