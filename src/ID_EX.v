`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:56 12/07/2021 
// Design Name: 
// Module Name:    ID_EX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ID_EX #(localparam SIZE = 32)(
	input clk, 
	
	// Data
	input hit,
	input [SIZE-1:0] readData1, 
	input [SIZE-1:0] readData2,
	input [SIZE-1:0] signExImmediate,
	
	output hit_OUT,
	output reg [SIZE-1:0] readData1_OUT = 0, 
	output reg [SIZE-1:0] readData2_OUT = 0,
	output reg [SIZE-1:0] signExImmediate_OUT = 0,
	
	// Control Unit
	input RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
	input [2:0] ALUOp,
	
	output reg RegDst_OUT, ALUSrc_OUT, MemtoReg_OUT, RegWrite_OUT, MemRead_OUT, MemWrite_OUT, Branch_OUT,
	output reg [2:0] ALUOp_OUT,
	
	// registers and operations
	input [4:0] rt,
	input [4:0] rd,
	input [5:0] funct,
	input [SIZE-1:0] nextPc,
	
	output reg [4:0] rt_OUT = 0,
	output reg [4:0] rd_OUT = 0,
	output reg [5:0] funct_OUT = 0,
	output reg [SIZE-1:0] nextPc_OUT = 0
    );
	 
	 assign hit_OUT = hit;
	 
	 always @(negedge clk)
	 begin
		if (hit)
		begin
			readData1_OUT = readData1;
			readData2_OUT = readData2;
			signExImmediate_OUT = signExImmediate;
			
			RegDst_OUT = RegDst;
			ALUSrc_OUT = ALUSrc;
			MemtoReg_OUT = MemtoReg;
			RegWrite_OUT = RegWrite;
			MemRead_OUT = MemRead;
			MemWrite_OUT = MemWrite;
			Branch_OUT = Branch;
			ALUOp_OUT = ALUOp;
			
			rt_OUT =  rt;
			rd_OUT = rd;
			funct_OUT = funct;
			nextPc_OUT = nextPc;
		end
	 end


endmodule
