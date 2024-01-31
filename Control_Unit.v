module Control_Unit(
CU_Clock,
CU_Reset,
CU_Start,
CU_Load_Q,
CU_Load_R,
CU_Load_P,
CU_Load_G,
CU_Shift ,
CU_Clear ,
CU_Cnt_en,
CU_Done,
CU_LSB_Q,
CU_Cnt_Out,
CU_Ack
);

input CU_Clock;
input CU_Reset;
input CU_Start;
input CU_LSB_Q;
input CU_Cnt_Out;
input CU_Ack;

output CU_Load_Q;
output CU_Load_R;
output CU_Load_P;
output CU_Load_G;
output CU_Shift ;
output CU_Clear ;
output CU_Cnt_en;
output CU_Done  ;

reg [2:0] present_state;
reg [2:0] next_state;
reg CU_Load_Q;
reg CU_Load_R;
reg CU_Load_P;
reg CU_Load_G;
reg CU_Shift ;
reg CU_Clear ;
reg CU_Cnt_en;
reg CU_Done  ;

//Typical Gray code
parameter Idle =  3'b000;
parameter Init =  3'b001;
parameter Empty=  3'b011;
parameter Add  =  3'b010;
parameter Shift = 3'b110;
parameter Done  = 3'b111;

always@(posedge CU_Clock or posedge CU_Reset)
begin
	if(CU_Reset)
		present_state<=Idle;
	else
		present_state<=next_state;
end 

always@(*)
begin 
	case(present_state)
		Idle:
			begin 
				if(CU_Start)
					next_state=Init;
				else
					next_state=Idle;
				CU_Shift =1'b0;
				CU_Cnt_en=1'b0;
				CU_Load_Q=1'b0;
				CU_Load_R=1'b0;
				CU_Load_P=1'b0;
				CU_Load_G=1'b0;
				CU_Done  =1'b0;
				CU_Clear =1'b0;
			end
		Init:
			begin 
				next_state=Empty;
				CU_Shift =1'b0;
				CU_Cnt_en=1'b0;
				CU_Load_Q=1'b1;
				CU_Load_R=1'b1;
				CU_Load_P=1'b0;
				CU_Load_G=1'b0;
				CU_Done  =1'b0;
				CU_Clear =1'b1;
			end
		Empty:
			begin
				if(CU_Cnt_Out)
					next_state=Done;
				else if(CU_LSB_Q)
					next_state=Add;
				else if(!CU_LSB_Q)
					next_state=Shift;
				CU_Shift =1'b0;
				CU_Cnt_en=1'b0;
				CU_Load_Q=1'b0;
				CU_Load_R=1'b0;
				CU_Load_P=1'b0;
				CU_Load_G=1'b0;
				CU_Done  =1'b0;
				CU_Clear =1'b0;
			end
		Add:
			begin
				next_state=Shift;
				CU_Shift =1'b0;
				CU_Cnt_en=1'b0;
				CU_Load_Q=1'b0;
				CU_Load_R=1'b0;
				CU_Load_P=1'b1;
				CU_Load_G=1'b1;
				CU_Done  =1'b0;
				CU_Clear =1'b0;
			end 
		Shift:
			begin
				next_state=Empty;
				CU_Shift =1'b1;
				CU_Cnt_en=1'b1;
				CU_Load_Q=1'b0;
				CU_Load_R=1'b0;
				CU_Load_P=1'b0;
				CU_Load_G=1'b0;
				CU_Done  =1'b0;
				CU_Clear =1'b0;
			end
		Done:
			begin
				if(CU_Ack)
					next_state=Idle;
				else 
					next_state=Done;
				CU_Shift =1'b0;
				CU_Cnt_en=1'b0;
				CU_Load_Q=1'b0;
				CU_Load_R=1'b0;
				CU_Load_P=1'b0;
				CU_Load_G=1'b0;
				CU_Done  =1'b1;
				CU_Clear =1'b0;
 
			end
	endcase
end

endmodule 