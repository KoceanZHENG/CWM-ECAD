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
	3b'100: rag<=110;
	3b'110: rag<=001;
	3b'001: rag<=010;
	3b'010: rag<=100;
	default: rag<=100;
	endcase
end
endmodule