// Lab1FSM.v

`timescale 100 ps/100 ps
module Lab1FSM (
  Clock,
  Reset,
  In,
  Out,
  State
)
;
input Clock ;
input Reset ;
input In ;
output Out ;
output [2:0] State ;
wire Clock ;
wire Reset ;
wire In ;
wire Out ;
wire [3:0] State_1;
wire [4:1] State_1_nss;
wire VCC ;
wire GND ;
wire N_2 ;
wire N_3 ;
wire N_4 ;
wire N_5 ;
wire N_6 ;
wire N_43_i ;
wire GND_Z ;
wire VCC_Z ;
// @2:72
  FD \State_1_Z[0]  (
	.Q(State_1[0]),
	.D(N_43_i),
	.C(Clock)
);
// @2:74
  FD \State_1_Z[1]  (
	.Q(State_1[1]),
	.D(State_1_nss[1]),
	.C(Clock)
);
// @2:76
  FD \State_1_Z[2]  (
	.Q(State_1[2]),
	.D(State_1_nss[2]),
	.C(Clock)
);
// @2:78
  FD \State_1_Z[3]  (
	.Q(State_1[3]),
	.D(State_1_nss[3]),
	.C(Clock)
);
// @2:80
  FD \State_1_Z[4]  (
	.Q(State[2]),
	.D(State_1_nss[4]),
	.C(Clock)
);
// @2:72
  LUT3_L \State_1_RNO[0]  (
	.I0(In),
	.I1(Reset),
	.I2(State_1[2]),
	.LO(N_43_i)
);
defparam \State_1_RNO[0] .INIT=8'hCD;
// @2:64
  LUT3_L \State_1_srsts_0_a3[1]  (
	.I0(In),
	.I1(Reset),
	.I2(State_1[0]),
	.LO(State_1_nss[1])
);
defparam \State_1_srsts_0_a3[1] .INIT=8'h20;
// @2:64
  LUT4_L \State_1_srsts_0_a3[2]  (
	.I0(In),
	.I1(Reset),
	.I2(State_1[0]),
	.I3(State_1[3]),
	.LO(State_1_nss[2])
);
defparam \State_1_srsts_0_a3[2] .INIT=16'h0002;
// @2:64
  LUT3_L \State_1_srsts_0_a3[3]  (
	.I0(In),
	.I1(Reset),
	.I2(State_1[2]),
	.LO(State_1_nss[3])
);
defparam \State_1_srsts_0_a3[3] .INIT=8'h10;
// @2:64
  LUT3_L \State_1_srsts_0_a3[4]  (
	.I0(In),
	.I1(Reset),
	.I2(State_1[3]),
	.LO(State_1_nss[4])
);
defparam \State_1_srsts_0_a3[4] .INIT=8'h20;
  LUT2 \State_1_RNIV0K1[2]  (
	.I0(State_1[2]),
	.I1(State_1[3]),
	.O(State[1])
);
defparam \State_1_RNIV0K1[2] .INIT=4'hE;
  LUT2 \State_1_RNIUSJ1[1]  (
	.I0(State_1[1]),
	.I1(State_1[3]),
	.O(State[0])
);
defparam \State_1_RNIUSJ1[1] .INIT=4'hE;
//@2:64
  assign GND_Z = 1'b0;
  assign VCC_Z = 1'b1;
assign Out = State[2];
endmodule
