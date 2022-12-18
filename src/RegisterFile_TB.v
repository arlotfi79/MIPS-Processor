`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:35 11/01/2021
// Design Name:   RegisterFile
// Module Name:   C:/Alireza/CALab/Homework1/RegisterFile_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterFile_TB;

	// Inputs
	reg regWrite;
	reg clk;
	reg [4:0] writeReg;
	reg [31:0] writeData;
	reg [4:0] readReg1;
	reg [4:0] readReg2;

	// Outputs
	wire [31:0] readData1;
	wire [31:0] readData2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.regWrite(regWrite), 
		.clk(clk), 
		.writeReg(writeReg), 
		.writeData(writeData), 
		.readReg1(readReg1), 
		.readData1(readData1), 
		.readReg2(readReg2), 
		.readData2(readData2)
	);
	
	initial
	begin
		clk = 0;
		regWrite = 0;
		writeReg = 0;
		writeData = 0;
		readReg1 = 0;
		readReg2 = 0;
	end
	
	always #50 clk = ~clk;
	initial begin
		#10
		regWrite = 1;
		writeReg = 5'b00001;
		writeData = 32'b00000000000000000000000000001010;
		
		#50
		regWrite = 1;
		writeReg = 5'b00010;
		writeData = 32'b00000000000000000000000000001011;
		
		
		#50
		regWrite = 0;
		writeReg = 5'b00011;
		writeData = 32'b00000000000000000000000000001100;
		
		#50
		regWrite = 1;
		writeReg = 5'b00000;
		writeData = 32'b00000000000000000000000000001100;
		
		#50
		readReg1 = 5'b00001;
		readReg2 = 5'b00010;
		
		#50
		readReg1 = 5'b00011;
		readReg2 = 5'b00011;
		
		

	end
      
endmodule

