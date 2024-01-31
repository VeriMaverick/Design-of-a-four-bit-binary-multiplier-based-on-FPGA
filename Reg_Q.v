module Reg_Q(
Reg_Q_Clock,
Reg_Q_In,
Reg_Q_Load,
Reg_Q_Shift,
Reg_Q_LSB
);

input [3:0]	Reg_Q_In;
input Reg_Q_Load;
input Reg_Q_Clock;
input Reg_Q_Shift;

output Reg_Q_LSB;

reg [3:0]Q_Reg;

always @ ( posedge Reg_Q_Clock )
begin 
	if(Reg_Q_Load)
		Q_Reg <= Reg_Q_In;
	else if(Reg_Q_Shift)
		Q_Reg <= { 1'b0 , Q_Reg[3:1] };
	else
		Q_Reg <= Q_Reg;
end 

assign Reg_Q_LSB = Q_Reg[0];

endmodule 