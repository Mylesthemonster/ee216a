//----------------------------------------------------------------------------
// bcd_convert.v
// ---------------------------------------------------------------------------

module bcd_convert(clk, rst, bin_in, bcd_out);
input clk, rst;
input [5:0] bin_in;
output reg [7:0] bcd_out;
reg [3:0] half1, half2;
reg [7:0] calculated;

always @(bin_in)
begin
   if(bin_in<10)
	calculated = {2'b0, bin_in};
   else begin
	half1 = bin_in / 10;
	half2 = bin_in % 10;
	calculated = {half1, half2};
   end
end
always @(negedge clk or negedge rst)
begin
   if(!rst) bcd_out <= 8'bz;
   else bcd_out <= calculated;
end
endmodule


