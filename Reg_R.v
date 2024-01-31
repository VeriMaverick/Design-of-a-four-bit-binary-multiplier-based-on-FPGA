module Reg_R(
Reg_R_Clock,
Reg_R_In,
Reg_R_Load,
Reg_R_Out
);

input Reg_R_Clock;
input [3:0] Reg_R_In;
input Reg_R_Load;

output[3:0] Reg_R_Out;

reg [3:0] Reg_R_Out;

always@(posedge Reg_R_Clock)
begin 
	if(Reg_R_Load)
		Reg_R_Out <= Reg_R_In;
	else 
		Reg_R_Out <= Reg_R_In;
end 

endmodule 