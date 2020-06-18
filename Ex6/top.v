//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top(
	input clk, sel, rst, button;
	output [2:0] result
);

wire [2:0] throw;
wire [2:0] rag;

dice my_dice(.clk(clk), .rst(rst), .button(button), .throw(throw));
traffic_light my_traffic_light(.clk(clk), .red(red), .amber(amber), .green(green));
mux multiplexer(.a(throw), .b(rag), .out(result));

endmodule
