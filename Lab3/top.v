//---------------------------------------------------------------------------
// top.v
// ---------------------------------------------------------------------------

module top(clk1, clk2, sel_clk, rst, final_bcd_count, ck_mx_sw_ctr, lfsr_sw_ctr, sd_sw_ctr, cnt_sw_ctr, bcd_sw_ctr, iso1, iso2, iso3, iso4, iso5, save_cnt, restore_cnt);
input clk1, clk2;
input sel_clk;
input rst;
input ck_mx_sw_ctr, lfsr_sw_ctr, sd_sw_ctr, cnt_sw_ctr, bcd_sw_ctr;
input iso1, iso2, iso3, iso4, iso5;
input save_cnt, restore_cnt;
output [7:0] final_bcd_count;
wire clk;
wire lfsr_out;
wire [3:0] lfsr_stored;
wire DETECTION;
wire [5:0] detection_count;

//INSTANTIATIONS
clk_mux     CM   (.clk1(clk1), .clk2(clk2), .sel_clk(sel_clk), .clk_out(clk));
lfsr        LFSR (.reg_out(lfsr_stored), .out(lfsr_out), .clk(clk), .rst(rst));
seqdet      SD   (.clk(clk), .rst(rst), .din(lfsr_out), .out(DETECTION));
counter     CNT  (.clk(clk), .rst(rst), .trigger(DETECTION), .count1(detection_count));
bcd_convert BCD  (.clk(clk), .rst(rst), .bin_in(detection_count), .bcd_out(final_bcd_count));


endmodule

