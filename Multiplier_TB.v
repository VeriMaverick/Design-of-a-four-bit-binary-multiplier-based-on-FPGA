`timescale 1 ps/ 1 ps
module Multiplier_TB();

// test vector input registers
reg Ack;
reg Clock;
reg [3:0] Multiplier_Q;
reg [3:0] Multiplier_R;
reg Reset;
reg Start;
// wires
wire Done;
wire [7:0]  Multiplier_P;

integer I=0;
integer J=0;

// assign statements (if any)
Multiplier i1 (
// port map - connection between master ports and signals/registers
	.Ack(Ack),
	.Clock(Clock),
	.Done(Done),
	.Multiplier_P(Multiplier_P),
	.Multiplier_Q(Multiplier_Q),
	.Multiplier_R(Multiplier_R),
	.Reset(Reset),
	.Start(Start)
);

parameter Clock_T = 20;
initial
Clock = 0;
always #(Clock_T/2) Clock=~Clock;

initial
begin
Ack = 1;
Multiplier_Q = 4'b1111;
Multiplier_R = 4'b1111;
Reset = 1;
Start = 0;

for(I=0;I<=15;I=I+1)
	begin
		#200Reset = 1;
		#200 Reset = 0;
		Multiplier_Q = Multiplier_Q + 1'b1;
	for(J=0;J<=15;J=J+1)
		begin
			#200 Reset = 0;
			Multiplier_R = Multiplier_R + 1'b1;
			#200 Start = 1;
			#200 Start = 0;
			#200 Reset = 1;

		end
end

#1000	$stop;
// --> end
// --> end
$display("Running testbench");
end
 
endmodule 