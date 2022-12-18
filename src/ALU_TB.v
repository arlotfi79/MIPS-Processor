`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:42:33 12/07/2021
// Design Name:   ALU
// Module Name:   C:/Alireza/CALab/Homework1/ALU_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TB;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg [3:0] ALUCnt;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.input1(input1), 
		.input2(input2), 
		.ALUCnt(ALUCnt), 
		.shamt(shamt), 
		.result(result), 
		.zero(zero)
	);
	
	initial begin
		input1 = 32'b1111;
		input2 = 32'b101;
		shamt = 1;
	end
	
	
	initial begin

		ALUCnt = 4'b0000;

		#100;
		ALUCnt = 4'b0100;
		
		#100;
		ALUCnt = 4'b1000; 
		
		#100;
		ALUCnt = 4'b0111; 

	end
      
endmodule

