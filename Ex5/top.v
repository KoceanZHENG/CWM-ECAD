//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module traffic_light(
//Todo: add ports
input clk;
output reg red,amber,green;
)
//Todo: add wire
wire[2:0] rag = {red,amber,green};

//Todo: add user logic
always @ (posedge clk) 
begin
	case(rag)
	3'b100: rag<=3'b110;
	3'b110: rag<=3'b001;
	3'b001: rag<=3'b010;
	3'b010: rag<=3'b100;
	default: rag<=3'b100;
	endcase
end
endmodule