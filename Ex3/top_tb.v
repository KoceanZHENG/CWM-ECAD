//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg rst;
	reg enable;
	reg direction;
	reg clk;
	reg err;
	reg [7:0] counter_prev;
	wire [7:0] counter_out;

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
	enable = 0;
	err = 0;
	direction = 0;
	rst = 0;
	#5
	forever begin
	#5
	   rst = 1;
	#5
	 //Testing reset
	if(counter_out!=0)
	begin
		$display("Test Failed! Reset doesn't work");
		err = 1;
	end

	#5
	//Testing enable
	rst = 0;
	enable = 0;
	counter_prev = counter_out;
	#(CLK_PERIOD)
	if(counter_prev != counter_out)
	begin
		$display("Test Failed! Enable doesn't work");
		err = 1;
	end




	#5
	//Testing counting up
	rst = 0;
	enable =1;
	direction = 1;
	counter_prev = counter_out;
	#(CLK_PERIOD)
	if(counter_prev > counter_out)
	begin
		$display("Test Failed! Counting up doesn't work");
		err = 1;
	end
	


	#5
	//Testing counting down
	rst = 0;
	enable =1;
	direction = 0;
	counter_prev = counter_out;
	#(CLK_PERIOD)
	if(counter_prev < counter_out)
	begin
		$display("Test Failed! Counting down doesn't work");
		err = 1;
	end
	end
end



//Todo: Finish test, check for success
initial
begin
	#200
	if(err ==0)
	$display("Test Passed!");
	$finish;
end


//Todo: Instantiate counter module
counter top(
.clk(clk),
.rst(rst),
.enable(enable),
.direction(direction),
.counter_out(counter_out)
);

 
endmodule 
