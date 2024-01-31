module Counter(
Counter_Clear,
Counter_Clock,
Counter_Out,
Counter_En
);
input Counter_Clock;
input Counter_Clear;
input Counter_En; 

output Counter_Out;

reg [2:0] Counter_Num;

always@(posedge Counter_Clock)
begin
	if(Counter_Clear)
		Counter_Num<=1'b0;
	else if(Counter_En)
		Counter_Num<= 1'b1 + Counter_Num;
end

assign Counter_Out = Counter_Num[2];

endmodule 