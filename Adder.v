module Adder(
Adder_In0,
Adder_In1,
Adder_Sum,
Adder_Cout
);

input  [3:0]Adder_In0;
input  [3:0]Adder_In1;

output  [3:0]Adder_Sum;
output  Adder_Cout;

assign   { Adder_Cout , Adder_Sum } = Adder_In0 + Adder_In1 ;

endmodule 