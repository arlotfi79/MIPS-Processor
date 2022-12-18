`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:46 10/31/2021
// Design Name:   Add
// Module Name:   C:/Alireza/CALab/Homework1/Add_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Add
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Add_TB;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Add uut (
		.in(in), 
		.out(out)
	);

	initial begin
		#5
		in = 32'b00000000000000000000000001011100;
		



	end
      
endmodule

