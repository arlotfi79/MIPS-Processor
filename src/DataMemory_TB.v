`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:09 12/16/2021
// Design Name:   DataMemory
// Module Name:   C:/Alireza/CALab/Homework1/DataMemory_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_TB;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [31:0] writeData;
	reg MemRead;
	reg MemWrite;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.address(address), 
		.writeData(writeData), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.readData(readData)
	);
	
	initial begin
		clk = 0;
		address = 32'b0;
		writeData = 32'b101;
		MemRead = 0;
		MemWrite = 0;
	end
	
	always #25 clk = ~clk;
	initial begin
		#200;
		MemWrite = 1;

		#200
		MemWrite = 0;
		MemRead = 1;

	end
      
endmodule

