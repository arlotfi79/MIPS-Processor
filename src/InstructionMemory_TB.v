`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:34:31 10/15/2021
// Design Name:   InstructionMemory
// Module Name:   C:/Alireza/CALab/Homework1/InstructionMemory_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_TB;

	// Inputs
	reg [31:0] address;
	reg clk;

	// Outputs
	wire [127:0] dataLine;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.address(address), 
		.clk(clk), 
		.dataLine(dataLine)
	);
	
	initial begin
		clk = 0;
	end
	
	always #25 clk = ~clk; 
	initial begin
		// 5 clk
		//-------
		#5
		address = 32'b00000000000000000000000000001010;
		
		#50
		address = 32'b00000000000000000000000000001010;
		
		#50
		address = 32'b00000000000000000000000000001010;
		
		#50
		address = 32'b00000000000000000000000000001010;
		
		#50
		address = 32'b00000000000000000000000000001010;
		// ------
		#50
		address = 32'b00000000000000000000000000001111;
		
		
		



	end
      
endmodule

