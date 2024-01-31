module Reg_P(
Reg_P_Clock,
Reg_P_Clear,
Reg_P_In,
Reg_P_Load,
Reg_P_Shift,
Reg_P_Out,
Reg_P_Carry,
Reg_P_to_Adder
);
 
input Reg_P_Clock;
input Reg_P_Clear;
input [3:0] Reg_P_In;
input Reg_P_Shift;
input Reg_P_Load;
input Reg_P_Carry;

output [7:0] Reg_P_Out;
output [3:0] Reg_P_to_Adder;

reg [7:0] P_Reg;

always@(posedge Reg_P_Clock or posedge Reg_P_Clear)
 begin 
	if(Reg_P_Clear)
		P_Reg<=8'b0;
	else if(Reg_P_Load)
		P_Reg[7:4]<=Reg_P_In;
	else if(Reg_P_Shift)
    P_Reg <= {Reg_P_Carry,P_Reg[7:1]};
	else 
	P_Reg <= P_Reg;
end

assign Reg_P_Out = P_Reg;
assign Reg_P_to_Adder = P_Reg[7:4];

endmodule 


