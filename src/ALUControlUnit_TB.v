`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:32:59 12/07/2021
// Design Name:   ALUControlUnit
// Module Name:   C:/Alireza/CALab/Homework1/ALUControlUnit_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUControlUnit_TB;

	// Inputs
	reg [2:0] ALUOp;
	reg [5:0] Function;

	// Outputs
	wire [3:0] ALUcnt;

	// Instantiate the Unit Under Test (UUT)
	ALUControlUnit uut (
		.ALUOp(ALUOp), 
		.Function(Function), 
		.ALUcnt(ALUcnt)
	);

	initial begin
      ALUOp = 0;
		Function = 6'b000011;
		
		#200
		ALUOp = 3'b010;
		Function = 6'b000111;
		
		#200
		ALUOp = 3'b100;
		Function = 6'b000101;

	end
      
endmodule

