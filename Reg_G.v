module Reg_G(
Reg_G_Clock,
Reg_G_Clear,
Reg_G_Load,
Reg_G_Shift,
Reg_G_In,
Reg_G_Out
);
input Reg_G_Clear;
input Reg_G_Clock;
input Reg_G_Load;
input Reg_G_Shift;
inout Reg_G_In;

output Reg_G_Out;

reg G_Reg;

always@( posedge Reg_G_Clock )
begin 
	if(Reg_G_Clear)
		G_Reg <= 0;
   else if(Reg_G_Load)
		G_Reg <= Reg_G_In;
	else if(Reg_G_Shift)
		G_Reg <= 0;
end
 
assign Reg_G_Out = G_Reg;
 
endmodule 