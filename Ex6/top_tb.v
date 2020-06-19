//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module top_tb(
);

//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	reg sel;
	reg err;
	reg rst;
	reg button;
	wire red, amber, green;
	reg [2:0] result;
	
//Clock generation
	initial
	begin
	clk = 1;
	forever
	#(CLK_PERIOD/2) clk = ~clk;
	end

//User logic
initial
begin
	err = 0;
	
	#(CLK_PERIOD)
	forever begin
	//Test selection to dice
	sel = 0;
	if(red || amber || green) begin
	$display("Selection to dice is wrong!");
	err = 1;
	end

	#(CLK_PERIOD)
	//Test selection to traffic light
	if (~red && ~amber && ~green) begin
	$display("Selection to traffic light is wrong!");
	err = 1;
	end
end

//Finish test, check for success
initial
begin
	#100
	if (err ==0)
	$display("Test passed!");
	$finish
end

//Instantiate module
top top(
.clk(clk),
.sel(sel),
.rst(rst),
.button(button),
.result(result)
);

end module
	