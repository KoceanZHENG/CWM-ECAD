//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
    input rst, clk, enable, direction;
    output  reg counter_out[7:0]
    );
                    
    //Todo: add registers and wires, if needed

    //Todo: add user logic
    always @ (posedge clk) begin
    if (rst) begin
    counter_out <=0;
    else if (enable)
       counter_out <= (direction==1)? counter_out + 1:counter_out - 1;
    else
    counter_out<=counter_out;
    end  
    end
endmodule
