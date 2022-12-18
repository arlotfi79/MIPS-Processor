`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:03 12/16/2021
// Design Name:   EX_MEM
// Module Name:   C:/Alireza/CALab/Homework1/EX_MEX_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EX_MEM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EX_MEX_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg [31:0] ALUResult;
	reg [31:0] readData2;
	reg [4:0] writeReg;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire [31:0] branchTarget_Out;
	wire zeroFlag_Out;
	wire [31:0] ALUResult_Out;
	wire [31:0] readData2_Out;
	wire [4:0] writeReg_Out;
	wire MemRead_Out;
	wire MemWrite_Out;
	wire Branch_Out;
	wire RegWrite_Out;
	wire MemToReg_Out;
	wire hit_Out;

	// Instantiate the Unit Under Test (UUT)
	EX_MEM uut (
		.clk(clk), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.ALUResult(ALUResult), 
		.readData2(readData2), 
		.writeReg(writeReg), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.branchTarget_Out(branchTarget_Out), 
		.zeroFlag_Out(zeroFlag_Out), 
		.ALUResult_Out(ALUResult_Out), 
		.readData2_Out(readData2_Out), 
		.writeReg_Out(writeReg_Out), 
		.MemRead_Out(MemRead_Out), 
		.MemWrite_Out(MemWrite_Out), 
		.Branch_Out(Branch_Out), 
		.RegWrite_Out(RegWrite_Out), 
		.MemToReg_Out(MemToReg_Out), 
		.hit_Out(hit_Out)
	);
	
	initial begin
		clk = 0;
		hit = 0;
		branchTarget = 32'b0;
		zeroFlag = 0;
		ALUResult = 32'b0;
		readData2 = 32'b0;
		writeReg = 5'b0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 1'bx;
		RegWrite = 0;
		MemToReg = 0;
	end
	
	always #25 clk = ~clk;

	initial begin
		#100;
		hit = 1;
		branchTarget = 32'b1;
		zeroFlag = 1;
		ALUResult = 32'b1;
		readData2 = 32'b1;
		writeReg = 5'b1;
		MemRead = 1;
		MemWrite = 1;
		Branch = 1;
		RegWrite = 1;
		MemToReg = 1;
        
		#100;
		hit = 1;
		branchTarget = 32'b0;
		zeroFlag = 0;
		ALUResult = 32'b0;
		readData2 = 32'b0;
		writeReg = 5'b0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		RegWrite = 0;
		MemToReg = 0;

	end
      
endmodule

