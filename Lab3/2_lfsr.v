//----------------------------------------------------------------------------
// lfsr.v
// ---------------------------------------------------------------------------


////////////////// LFSR ///////////////////
//SEED 4'b1000
module lfsr(reg_out, out, clk, rst);
output reg [3:0] reg_out;
output reg out;
input clk, rst; 
reg [3:0] temp;
wire din0, din1, din2, din3, din4, feed;

dff_h D0(.q(din1), .d(din0), .clk(clk), .rst(rst));
dff_h D1(.q(din2), .d(din1), .clk(clk), .rst(rst));
dff   D2(.q(din3), .d(din2), .clk(clk), .rst(rst));
dff_h D3(.q(din4), .d(din3), .clk(clk), .rst(rst));
dff   D4(.q(feed), .d(din4), .clk(clk), .rst(rst));

xor xor1(din0, feed, din3);

always @(din1 or din2 or din3 or feed)
begin
   reg_out <= {din1,  din2, din3, feed};
end

always @(feed)
   out <= feed;
endmodule
////////////////////////////////////////////

/////////////// D Flip Flop1 ///////////////
module dff_h(q, d, clk, rst);
output reg q;
input d;
input clk, rst;

always @(posedge clk or negedge rst)
begin
   if(~rst) q<= 1'b1;		// To avoid 4'b000 as seed
   else     q <= d;
end
endmodule
///////////////////////////////////////////

/////////////// D Flip Flop2 ///////////////
module dff(q, d, clk, rst);
output reg q;
input d;
input clk, rst;

always @(posedge clk or negedge rst)
begin
   if(~rst) q<= 1'b0;
   else     q <= d;
end
endmodule
///////////////////////////////////////////



