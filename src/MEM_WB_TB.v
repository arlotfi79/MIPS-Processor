`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:18:33 12/17/2021
// Design Name:   MEM_WB
// Module Name:   C:/Alireza/CALab/Homework1/MEM_WB_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEM_WB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEM_WB_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] readData;
	reg [31:0] ALUResult;
	reg [4:0] writeReg;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire hit_OUT;
	wire [31:0] readData_OUT;
	wire [31:0] ALUResult_OUT;
	wire [4:0] writeReg_OUT;
	wire RegWrite_OUT;
	wire MemToReg_OUT;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB uut (
		.clk(clk), 
		.hit(hit), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeReg(writeReg), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.hit_OUT(hit_OUT), 
		.readData_OUT(readData_OUT), 
		.ALUResult_OUT(ALUResult_OUT), 
		.writeReg_OUT(writeReg_OUT), 
		.RegWrite_OUT(RegWrite_OUT), 
		.MemToReg_OUT(MemToReg_OUT)
	);
	
	initial begin
		clk = 0;
		hit = 0;
		readData =  32'b0;
		ALUResult =  32'b0;
		writeReg =  5'b0;
		RegWrite = 0;
		MemToReg = 0;
	end
	
	always #25 clk = ~clk;
	initial begin
		#200;
		hit = 1;
		readData =  32'b1;
		ALUResult =  32'b1;
		writeReg =  5'b1;
		RegWrite = 1;
		MemToReg = 1;

	end
      
endmodule

