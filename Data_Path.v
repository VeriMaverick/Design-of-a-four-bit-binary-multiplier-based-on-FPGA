module Data_Path(
DP_Q_In,
DP_R_In,
DP_P_Out,
DP_Shift,
DP_Cnt_En,
DP_Load_G,
DP_Load_Q,
DP_Load_R,
DP_Load_P,
DP_Cnt_Out,
DP_Q_LSB,
DP_Clock,
DP_Clear
);

input DP_Clock;
input DP_Clear;
input [3:0] DP_R_In;
input [3:0] DP_Q_In;
input DP_Shift;
input DP_Cnt_En;
input DP_Load_Q;
input DP_Load_G;
input DP_Load_P;
input DP_Load_R;

output [7:0]DP_P_Out;
output DP_Cnt_Out;
output DP_Q_LSB;

wire 	[3:0]R_to_A;
wire	[3:0]A_to_P;
wire	[3:0]P_to_A;
wire	A_to_G;
wire 	G_to_P;

Reg_Q U0(
.Reg_Q_Clock(DP_Clock),
.Reg_Q_Load(DP_Load_Q),
.Reg_Q_In(DP_Q_In),
.Reg_Q_Shift(DP_Shift),
.Reg_Q_LSB(DP_Q_LSB)
);

Reg_R U1(
.Reg_R_Clock(DP_Clock),
.Reg_R_Load(DP_Load_R),
.Reg_R_In(DP_R_In),
.Reg_R_Out(R_to_A)
);

Reg_P U2(
.Reg_P_Clock(DP_Clock),
.Reg_P_Clear(DP_Clear),
.Reg_P_Load(DP_Load_P),
.Reg_P_Shift(DP_Shift),
.Reg_P_Out(DP_P_Out),
.Reg_P_Carry(G_to_P),
.Reg_P_to_Adder(P_to_A),
.Reg_P_In(A_to_P)
);

Reg_G	U3(
.Reg_G_Clear(DP_Clear),
.Reg_G_Clock(DP_Clock),
.Reg_G_Load(DP_Load_G),
.Reg_G_Shift(DP_Shift),
.Reg_G_In(A_to_G),
.Reg_G_Out(G_to_P)
);

Adder	U4(
.Adder_In0(R_to_A),
.Adder_In1(P_to_A),
.Adder_Sum(A_to_P),
.Adder_Cout(A_to_G)
);

Counter	U5(
.Counter_Clear(DP_Clear),
.Counter_Clock(DP_Clock),
.Counter_Out(DP_Cnt_Out),
.Counter_En(DP_Cnt_En)
);

endmodule 