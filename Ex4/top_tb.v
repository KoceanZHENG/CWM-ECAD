//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
);
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo:Registers and wires
	reg rst;
	reg clk;
	reg button;
	reg [2:0] throw_prev;
	wire [2:0] throw;
	reg err;

//Todo: Clock generation
	initial
	begin
	clk = 1;
	forever
	#(CLK_PERIOD/2) clk = ~clk;
	end

//Todo: User logic
initial
begin
	rst = 0;
	button = 0;
	err=0;

	#5
	forever begin

	#5
	//Testing reset
	rst = 1;
	if(throw != 0)
		$display("Test Failed! Reset doesn't work");
		err = 1;

	#5
	//Test button=1
	rst = 0;
	button = 1;
	throw_prev = throw;
	#(CLK_PERIOD)
	if (throw_prev != throw - 1)
		$display("Test Failed! Button=1 doesn't work");
		err = 1;
	else if (throw_prev ==7 || throw_prev = 6 && throw != 1)
		$display("Test Failed! Button=1 doesn't work");
		err = 1;


	#5
	//Test button =0
	button = 0;
	throw_prev = throw;
	#(CLK_PERIOD)
	if (throw_prev ==0 || throw_prev ==7 && throw !=1)
		$display("Test Failed! Button=0 doesn't work");
		err = 1;
	else if (throw_prev != throw)
		$display("Test Failed! Button=0 doesn't work");
		err = 1;
	

	end
end

//Todo: Finish test, check for success
initial
begin
	#200
	if(err = 0)
	$display("Test Passed!");
	$finish
end

//Todo: Instantiate dice module
dice top(
.clk(clk),
.rst(rst),
.button(button),
.throw(throw)
);

endmodule