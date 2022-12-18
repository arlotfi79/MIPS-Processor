`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:23 11/01/2021
// Design Name:   SignExtend
// Module Name:   C:/Alireza/CALab/Homework1/SignExtend_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtend_TB;

	// Inputs
	reg [15:0] immediate;

	// Outputs
	wire [31:0] signExtend;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.immediate(immediate), 
		.signExtend(signExtend)
	);

	initial begin
		
		immediate = 16'b0000000000001010;
		
		#100
		immediate = 16'b1000000000001010;



	end
      
endmodule

