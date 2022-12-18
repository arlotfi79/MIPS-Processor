`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:44:28 11/26/2021
// Design Name:   controlUnit
// Module Name:   C:/Alireza/CALab/Homework1/controlUnit_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnit_TB;

	// Inputs
	reg [5:0] OpCode;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire [2:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	controlUnit uut (
		.OpCode(OpCode), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp)
	);

	initial begin
		// Initialize Inputs
		OpCode = 6'b000000;
		
		#100
		OpCode = 6'b000101;

		#100
		OpCode = 6'b000110;
		
		#100
		OpCode = 6'b111111;



	end
      
endmodule

