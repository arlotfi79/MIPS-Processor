`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:39:05 12/17/2021
// Design Name:   WriteBack
// Module Name:   C:/Alireza/CALab/Homework1/WriteBack_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WriteBack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WriteBack_TB;

	// Inputs
	reg MemToReg;
	reg [31:0] readData;
	reg [31:0] ALUResult;

	// Outputs
	wire [31:0] writeData;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.MemToReg(MemToReg), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeData(writeData)
	);
	
	initial begin
		readData = 32'b1;
		ALUResult = 32'b11;
	end
	
	initial begin
		MemToReg = 0;
		
		#200;
		MemToReg = 1;

	end
      
endmodule

