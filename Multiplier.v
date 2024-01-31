module Multiplier(
Clock,
Reset,
Multiplier_Q,
Multiplier_R,
Multiplier_P,
Start,
Done,
Ack,
Q_Data0,
Q_Data1,
R_Data0,
R_Data1,
P_Data0,
P_Data1,
P_Data2
);

input Clock;
input Reset;
input [3:0]Multiplier_Q;
input [3:0]Multiplier_R;
input Start;
input Ack;

output [6:0]Q_Data0;
output [6:0]Q_Data1;
output [6:0]R_Data0;
output [6:0]R_Data1;
output [6:0]P_Data0;
output [6:0]P_Data1;
output [6:0]P_Data2;

output [7:0]Multiplier_P;
output Done;

wire Load_Q;
wire Load_R;
wire Load_P;
wire Load_G;
wire Clear ;
wire SHift ;
wire Cnt_Out;
wire Q_LSB;
wire Cnt_en;

Control_Unit	U0(
.CU_Clock(Clock), 
.CU_Reset(Reset),
.CU_Cnt_en(Cnt_en),
.CU_Start(Start),
.CU_Done(Done),
.CU_Shift(SHift),
.CU_Cnt_Out(Cnt_Out),
.CU_LSB_Q(Q_LSB),
.CU_Load_Q(Load_Q),
.CU_Load_R(Load_R),
.CU_Load_P(Load_P),
.CU_Load_G(Load_G),
.CU_Clear(Clear),
.CU_Ack(Ack)
);
		
Data_Path	U1(
.DP_Q_In(Multiplier_Q),
.DP_R_In(Multiplier_R),
.DP_P_Out(Multiplier_P),
.DP_Shift(SHift),
.DP_Cnt_En(Cnt_en),
.DP_Load_G(Load_G),
.DP_Load_Q(Load_Q),
.DP_Load_R(Load_R),
.DP_Load_P(Load_P),
.DP_Cnt_Out(Cnt_Out),
.DP_Q_LSB(Q_LSB),
.DP_Clock(Clock),
.DP_Clear(Clear)
);

Nixie_Tube	U2(
.Q_BCD(Multiplier_Q),
.R_BCD(Multiplier_R),
.P_BCD(Multiplier_P),
.Q_Data0(Q_Data0),
.Q_Data1(Q_Data1),
.R_Data0(R_Data0),
.R_Data1(R_Data1),
.P_Data0(P_Data0),
.P_Data1(P_Data1),
.P_Data2(P_Data2)
);
				
endmodule 