//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module dice(
//Todo: add ports
input clk, rst, button;
output reg [2:0] throw;
)

//Todo: add user logic
always @ (posedge clk || posedge rst) 
begin
if (rst)
	throw<=3b'0;
else if (button)
	throw<=(throw < 6 )? throw +1 : 1;
else
	throw<=(throw == 0 || throw == 7)? 1 : throw;
end
endmodule
