`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:06 11/01/2021
// Design Name:   Decode
// Module Name:   C:/Alireza/CALab/Homework1/Decode_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Decode_TB;

	// Inputs
	reg clk;
	reg [31:0] instruction;
	reg regWrite;
	reg [4:0] writeReg;
	reg [31:0] writeData;

	// Outputs
	wire [5:0] opCode;
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] signExtendedImmidiate;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	Decode uut (
		.clk(clk), 
		.instruction(instruction), 
		.regWrite(regWrite),
		.writeReg(writeReg),
		.writeData(writeData),
		.opCode(opCode), 
		.readData1(readData1), 
		.readData2(readData2), 
		.signExtendedImmidiate(signExtendedImmidiate), 
		.rt(rt), 
		.rd(rd)
	);
	
	initial 
	begin
		clk = 0;
		regWrite = 0;
		writeReg = 0;
		writeData = 0;
	end

	always #25 clk = ~clk;
	initial begin
		# 10
		instruction = 32'b00000100010000110000000000000100;
		//  I type        ******#####&&&&&@@@@@@@@@@@@@@@@
		
		
		# 100 //                 !!!!      !!!!
		instruction = 32'b0011100101101100010110000001010;
		//  R type        ******#####&&&&&%%%%%^^^^^@@@@@@


	end
      
endmodule

