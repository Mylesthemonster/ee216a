// Lab1Adder.v

`timescale 100 ps/100 ps

module Lab1Adder (
  A,
  B,
  Sum
)
;
input [7:0] A ;
input [7:0] B ;
output [7:0] Sum ;
wire un9_Sum_s_1 ;
wire un9_Sum_s_2 ;
wire un9_Sum_s_3 ;
wire un9_Sum_s_4 ;
wire un9_Sum_s_5 ;
wire un9_Sum_s_6 ;
wire un9_Sum_s_7 ;
wire GND ;
wire VCC ;
wire Sum15 ;
wire Sum14 ;
wire Sum14_7 ;
wire Sum16 ;
wire un9_Sum_axb_0 ;
wire un9_Sum_cry_0 ;
wire un9_Sum_axb_1 ;
wire un9_Sum_cry_1 ;
wire un9_Sum_axb_2 ;
wire un9_Sum_cry_2 ;
wire un9_Sum_axb_3 ;
wire un9_Sum_cry_3 ;
wire un9_Sum_axb_4 ;
wire un9_Sum_cry_4 ;
wire un9_Sum_axb_5 ;
wire un9_Sum_cry_5 ;
wire un9_Sum_axb_6 ;
wire un9_Sum_cry_6 ;
wire un9_Sum_axb_7 ;
wire Sum15_1_0 ;
wire Sum14_3 ;
wire Sum15_3 ;
wire Sum16_0_2 ;
wire Sum16_0_3 ;
wire Sum16_3 ;
wire VCC_Z ;
  GND GND_cZ (
	.G(GND)
);
// @2:53
  LUT2 un9_Sum_axb_1_cZ (
	.I0(A[1]),
	.I1(B[1]),
	.O(un9_Sum_axb_1)
);
defparam un9_Sum_axb_1_cZ.INIT=4'h6;
// @2:53
  LUT2 un9_Sum_axb_2_cZ (
	.I0(A[2]),
	.I1(B[2]),
	.O(un9_Sum_axb_2)
);
defparam un9_Sum_axb_2_cZ.INIT=4'h6;
// @2:53
  LUT2 un9_Sum_axb_3_cZ (
	.I0(A[3]),
	.I1(B[3]),
	.O(un9_Sum_axb_3)
);
defparam un9_Sum_axb_3_cZ.INIT=4'h6;
// @2:53
  LUT2 un9_Sum_axb_4_cZ (
	.I0(A[4]),
	.I1(B[4]),
	.O(un9_Sum_axb_4)
);
defparam un9_Sum_axb_4_cZ.INIT=4'h6;
// @2:53
  LUT2 un9_Sum_axb_5_cZ (
	.I0(A[5]),
	.I1(B[5]),
	.O(un9_Sum_axb_5)
);
defparam un9_Sum_axb_5_cZ.INIT=4'h6;
// @2:53
  LUT2 un9_Sum_axb_6_cZ (
	.I0(A[6]),
	.I1(B[6]),
	.O(un9_Sum_axb_6)
);
defparam un9_Sum_axb_6_cZ.INIT=4'h6;
// @2:49
  LUT4 \Sum_0_f0[4]  (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_4),
	.O(Sum[4])
);
defparam \Sum_0_f0[4] .INIT=16'h5554;
// @2:49
  LUT4 un9_Sum_s_1_RNIVQV6 (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_1),
	.O(Sum[1])
);
defparam un9_Sum_s_1_RNIVQV6.INIT=16'h0100;
// @2:49
  LUT4 un9_Sum_s_3_RNI1RV6 (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_3),
	.O(Sum[3])
);
defparam un9_Sum_s_3_RNI1RV6.INIT=16'h0100;
// @2:49
  LUT4 un9_Sum_s_7_RNI5RV6 (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_7),
	.O(Sum[7])
);
defparam un9_Sum_s_7_RNI5RV6.INIT=16'h0100;
// @2:49
  LUT4 \Sum_0_f0[0]  (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_axb_0),
	.O(Sum[0])
);
defparam \Sum_0_f0[0] .INIT=16'h0504;
// @2:49
  LUT4 \Sum_0_f0[2]  (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_2),
	.O(Sum[2])
);
defparam \Sum_0_f0[2] .INIT=16'h1110;
// @2:49
  LUT4 \Sum_0_f0[5]  (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_5),
	.O(Sum[5])
);
defparam \Sum_0_f0[5] .INIT=16'h1110;
// @2:49
  LUT4 \Sum_0_f0[6]  (
	.I0(Sum14),
	.I1(Sum15),
	.I2(Sum16),
	.I3(un9_Sum_s_6),
	.O(Sum[6])
);
defparam \Sum_0_f0[6] .INIT=16'h0302;
// @2:50
  LUT5 Sum14_cZ (
	.I0(A[5]),
	.I1(A[6]),
	.I2(B[6]),
	.I3(Sum14_3),
	.I4(Sum15_1_0),
	.O(Sum14)
);
defparam Sum14_cZ.INIT=32'h20000000;
// @2:51
  LUT5 Sum15_cZ (
	.I0(A[0]),
	.I1(A[5]),
	.I2(A[7]),
	.I3(Sum15_1_0),
	.I4(Sum15_3),
	.O(Sum15)
);
defparam Sum15_cZ.INIT=32'h10000000;
// @2:52
  LUT6 Sum16_cZ (
	.I0(A[3]),
	.I1(A[4]),
	.I2(A[7]),
	.I3(Sum16_0_2),
	.I4(Sum16_0_3),
	.I5(Sum16_3),
	.O(Sum16)
);
defparam Sum16_cZ.INIT=64'h0100000000000000;
// @2:50
  LUT6 Sum14_1_0 (
	.I0(A[1]),
	.I1(A[2]),
	.I2(A[3]),
	.I3(A[4]),
	.I4(B[2]),
	.I5(B[5]),
	.O(Sum15_1_0)
);
defparam Sum14_1_0.INIT=64'h8000000000000000;
// @2:52
  LUT5 Sum16_0_3_cZ (
	.I0(A[0]),
	.I1(A[1]),
	.I2(A[2]),
	.I3(B[1]),
	.I4(B[6]),
	.O(Sum16_0_3)
);
defparam Sum16_0_3_cZ.INIT=32'h00000002;
// @2:51
  LUT6 Sum15_3_cZ (
	.I0(A[6]),
	.I1(B[0]),
	.I2(B[1]),
	.I3(B[3]),
	.I4(B[6]),
	.I5(Sum14_7),
	.O(Sum15_3)
);
defparam Sum15_3_cZ.INIT=64'h0000080000000000;
// @2:50
  LUT6 Sum14_3_cZ (
	.I0(A[0]),
	.I1(A[7]),
	.I2(B[0]),
	.I3(B[1]),
	.I4(B[3]),
	.I5(Sum14_7),
	.O(Sum14_3)
);
defparam Sum14_3_cZ.INIT=64'h4000000000000000;
// @2:52
  LUT4 Sum16_3_cZ (
	.I0(B[0]),
	.I1(B[3]),
	.I2(B[4]),
	.I3(B[7]),
	.O(Sum16_3)
);
defparam Sum16_3_cZ.INIT=16'h0010;
// @2:52
  LUT4 Sum16_0_2_cZ (
	.I0(A[5]),
	.I1(A[6]),
	.I2(B[2]),
	.I3(B[5]),
	.O(Sum16_0_2)
);
defparam Sum16_0_2_cZ.INIT=16'h2000;
// @2:53
  LUT2 un9_Sum_axb_7_cZ (
	.I0(A[7]),
	.I1(B[7]),
	.O(un9_Sum_axb_7)
);
defparam un9_Sum_axb_7_cZ.INIT=4'h6;
// @2:53
  LUT2 un9_Sum_axb_0_cZ (
	.I0(A[0]),
	.I1(B[0]),
	.O(un9_Sum_axb_0)
);
defparam un9_Sum_axb_0_cZ.INIT=4'h6;
// @2:50
  LUT2 Sum14_7_cZ (
	.I0(B[4]),
	.I1(B[7]),
	.O(Sum14_7)
);
defparam Sum14_7_cZ.INIT=4'h4;
// @2:53
  XORCY un9_Sum_s_7_cZ (
	.LI(un9_Sum_axb_7),
	.CI(un9_Sum_cry_6),
	.O(un9_Sum_s_7)
);
// @2:53
  XORCY un9_Sum_s_6_cZ (
	.LI(un9_Sum_axb_6),
	.CI(un9_Sum_cry_5),
	.O(un9_Sum_s_6)
);
// @2:53
  MUXCY_L un9_Sum_cry_6_cZ (
	.DI(A[6]),
	.CI(un9_Sum_cry_5),
	.S(un9_Sum_axb_6),
	.LO(un9_Sum_cry_6)
);
// @2:53
  XORCY un9_Sum_s_5_cZ (
	.LI(un9_Sum_axb_5),
	.CI(un9_Sum_cry_4),
	.O(un9_Sum_s_5)
);
// @2:53
  MUXCY_L un9_Sum_cry_5_cZ (
	.DI(A[5]),
	.CI(un9_Sum_cry_4),
	.S(un9_Sum_axb_5),
	.LO(un9_Sum_cry_5)
);
// @2:53
  XORCY un9_Sum_s_4_cZ (
	.LI(un9_Sum_axb_4),
	.CI(un9_Sum_cry_3),
	.O(un9_Sum_s_4)
);
// @2:53
  MUXCY_L un9_Sum_cry_4_cZ (
	.DI(A[4]),
	.CI(un9_Sum_cry_3),
	.S(un9_Sum_axb_4),
	.LO(un9_Sum_cry_4)
);
// @2:53
  XORCY un9_Sum_s_3_cZ (
	.LI(un9_Sum_axb_3),
	.CI(un9_Sum_cry_2),
	.O(un9_Sum_s_3)
);
// @2:53
  MUXCY_L un9_Sum_cry_3_cZ (
	.DI(A[3]),
	.CI(un9_Sum_cry_2),
	.S(un9_Sum_axb_3),
	.LO(un9_Sum_cry_3)
);
// @2:53
  XORCY un9_Sum_s_2_cZ (
	.LI(un9_Sum_axb_2),
	.CI(un9_Sum_cry_1),
	.O(un9_Sum_s_2)
);
// @2:53
  MUXCY_L un9_Sum_cry_2_cZ (
	.DI(A[2]),
	.CI(un9_Sum_cry_1),
	.S(un9_Sum_axb_2),
	.LO(un9_Sum_cry_2)
);
// @2:53
  XORCY un9_Sum_s_1_cZ (
	.LI(un9_Sum_axb_1),
	.CI(un9_Sum_cry_0),
	.O(un9_Sum_s_1)
);
// @2:53
  MUXCY_L un9_Sum_cry_1_cZ (
	.DI(A[1]),
	.CI(un9_Sum_cry_0),
	.S(un9_Sum_axb_1),
	.LO(un9_Sum_cry_1)
);
// @2:53
  MUXCY_L un9_Sum_cry_0_cZ (
	.DI(A[0]),
	.CI(GND),
	.S(un9_Sum_axb_0),
	.LO(un9_Sum_cry_0)
);
  assign VCC_Z = 1'b1;
endmodule
