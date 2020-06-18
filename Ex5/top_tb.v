//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module top_tb(
);

//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	wire [2:0] rag;
	reg [2:0] rag_prev

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

	#5
	forever begin
	#5
	//Testing unwanted states
	if((rag != 3'b100) || (rag != 3'b110) || (rag != 3'b001) || (rag != 3'b010))
	$display("Unwanted States!");
	err = 1;

	//Testing order
	#5
	rag_prev = rag;
	#(CLOCK_PERIOD)
	if ((rag_prev = 3'b100) && (rag !=3'b110) ) begin
	$display("Wrong order!");
	err = 1;
	end
	else if ((rag_prev = 3'b110) && (rag !=3'b001) ) begin
	$display("Wrong order!");
	err = 1;
	end
	else if((rag_prev = 3'b001) && (rag !=3'b010) ) begin
	$display("Wrong order!");
	err = 1;
	end
	else if((rag_prev = 3'b010) && (rag !=3'b100) ) begin
	$display("Wrong order!");
	err = 1;
	end
	else
	err = 0;

	end
end

//Finish test, check for success
initial
begin
	#200
	if(err = 0)
	$display("Test Passed!");
	$finish
end

//Instantiate dice module
traffic_light top(
.clk(clk),
.red(red),
.amber(amber),
.green(green)
);

endmodule
