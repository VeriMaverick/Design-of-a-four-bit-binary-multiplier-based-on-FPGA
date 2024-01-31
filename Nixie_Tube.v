module Nixie_Tube(
Q_BCD,
R_BCD,
P_BCD,
Q_Data0,
Q_Data1,
R_Data0,
R_Data1,
P_Data0,
P_Data1,
P_Data2
);

input [3:0]Q_BCD;
input [3:0]R_BCD;
input [7:0]P_BCD;

output [6:0] Q_Data0;
output [6:0] Q_Data1;
output [6:0] R_Data0;
output [6:0] R_Data1;
output [6:0] P_Data0;//个位
output [6:0] P_Data1;//十位
output [6:0] P_Data2;//百位

reg [3:0]Q_BCD_A;
reg [3:0]Q_BCD_B;
reg [3:0]R_BCD_A;
reg [3:0]R_BCD_B;
reg [6:0] Q_Data0;
reg [6:0] Q_Data1;
reg [6:0] R_Data0;
reg [6:0] R_Data1;
reg [7:0] P_BCD_A;//百位
reg [7:0] P_BCD_B;//十位
reg [7:0] P_BCD_C;//个位
reg [6:0]P_Data0;
reg [6:0]P_Data1;
reg [6:0]P_Data2;

always @ ( Q_BCD )
begin
Q_BCD_A = Q_BCD/10;	//十位
Q_BCD_B = Q_BCD%10;	//个位
end 

always @ (Q_BCD_A)
begin
	case(Q_BCD_A)
		4'd0:   begin Q_Data1=7'b1000000;  end
		4'd1:   begin Q_Data1=7'b1111001;  end
      4'd2:   begin Q_Data1=7'b0100100;  end
		default:begin Q_Data1=7'b0111111;  end
	endcase 
end 

always @ (Q_BCD_B)
begin
		case(Q_BCD_B)
			4'd0:   begin Q_Data0=7'b1000000;   end
			4'd1:   begin Q_Data0=7'b1111001;   end
         4'd2:   begin Q_Data0=7'b0100100;   end
         4'd3:   begin Q_Data0=7'b0110000;   end
			4'd4:   begin Q_Data0=7'b0011001;   end
			4'd5:   begin Q_Data0=7'b0010010;   end
			4'd6:   begin Q_Data0=7'b0000010;   end
			4'd7:   begin Q_Data0=7'b1111000;   end
			4'd8:   begin Q_Data0=7'b0000000;   end
			4'd9:   begin Q_Data0=7'b0010000;   end
			default:begin Q_Data0=7'b0111111;   end
   endcase 
end 

always @ ( R_BCD )
begin
R_BCD_A = R_BCD/10;	//十位
R_BCD_B = R_BCD%10;	//个位
end 

always @ (R_BCD_A)//Q十位
begin
	case(R_BCD_A)
		4'd0:   begin R_Data1=7'b1000000;  end
		4'd1:   begin R_Data1=7'b1111001;  end
      4'd2:   begin R_Data1=7'b0100100;  end
		default:begin R_Data1=7'b0111111;  end
	endcase 
end 

always @ (R_BCD_B)//Q个位
begin
		case(R_BCD_B)
			4'd0:   begin R_Data0=7'b1000000;   end
			4'd1:   begin R_Data0=7'b1111001;   end
         4'd2:   begin R_Data0=7'b0100100;   end
         4'd3:   begin R_Data0=7'b0110000;   end
			4'd4:   begin R_Data0=7'b0011001;   end
			4'd5:   begin R_Data0=7'b0010010;   end
			4'd6:   begin R_Data0=7'b0000010;   end
			4'd7:   begin R_Data0=7'b1111000;   end
			4'd8:   begin R_Data0=7'b0000000;   end
			4'd9:   begin R_Data0=7'b0010000;   end
			default:begin R_Data0=7'b0111111;   end
   endcase 
end 

always @ ( P_BCD )
begin
P_BCD_A = P_BCD/100;		//百位
P_BCD_B = P_BCD/10%10;	//十位
P_BCD_C = P_BCD%10;		//个位
end 

always @ (P_BCD_A)//百位
begin
	case(P_BCD_A)
		4'd0:   begin P_Data2=7'b1000000;  end
		4'd1:   begin P_Data2=7'b1111001;  end
      4'd2:   begin P_Data2=7'b0100100;  end
		default:begin P_Data2=7'b0111111;  end
	endcase 
end 

always @ (P_BCD_B)//十位
begin
	case(P_BCD_B)
		4'd0:   begin P_Data1=7'b1000000;   end
		4'd1:   begin P_Data1=7'b1111001;   end
		4'd2:   begin P_Data1=7'b0100100;   end
		4'd3:   begin P_Data1=7'b0110000;   end
		4'd4:   begin P_Data1=7'b0011001;   end
		4'd5:   begin P_Data1=7'b0010010;   end
		4'd6:   begin P_Data1=7'b0000010;   end
		4'd7:   begin P_Data1=7'b1111000;   end
		4'd8:   begin P_Data1=7'b0000000;   end
		4'd9:   begin P_Data1=7'b0010000;   end
		default:begin P_Data1=7'b0111111;   end
   endcase 
end 

always @ (P_BCD_C)//个位
begin
		case(P_BCD_C)
			4'd0:   begin P_Data0=7'b1000000;   end
			4'd1:   begin P_Data0=7'b1111001;   end
         4'd2:   begin P_Data0=7'b0100100;   end
         4'd3:   begin P_Data0=7'b0110000;   end
			4'd4:   begin P_Data0=7'b0011001;   end
			4'd5:   begin P_Data0=7'b0010010;   end
			4'd6:   begin P_Data0=7'b0000010;   end
			4'd7:   begin P_Data0=7'b1111000;   end
			4'd8:   begin P_Data0=7'b0000000;   end
			4'd9:   begin P_Data0=7'b0010000;   end
			default:begin P_Data0=7'b0111111;   end
   endcase 
end

endmodule 