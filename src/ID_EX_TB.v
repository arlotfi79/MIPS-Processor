`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:29 12/07/2021
// Design Name:   ID_EX
// Module Name:   C:/Alireza/CALab/Homework1/ID_EX_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ID_EX_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] readData1;
	reg [31:0] readData2;
	reg [31:0] signExImmediate;
	reg RegDst;
	reg ALUSrc;
	reg MemtoReg;
	reg RegWrite;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg [2:0] ALUOp;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [5:0] funct;
	reg [31:0] nextPc;

	// Outputs
	wire hit_OUT;
	wire [31:0] readData1_OUT;
	wire [31:0] readData2_OUT;
	wire [31:0] signExImmediate_OUT;
	wire RegDst_OUT;
	wire ALUSrc_OUT;
	wire MemtoReg_OUT;
	wire RegWrite_OUT;
	wire MemRead_OUT;
	wire MemWrite_OUT;
	wire Branch_OUT;
	wire [2:0] ALUOp_OUT;
	wire [4:0] rt_OUT;
	wire [4:0] rd_OUT;
	wire [5:0] funct_OUT;
	wire [31:0] nextPc_OUT;

	// Instantiate the Unit Under Test (UUT)
	ID_EX uut (
		.clk(clk), 
		.hit(hit), 
		.readData1(readData1), 
		.readData2(readData2), 
		.signExImmediate(signExImmediate), 
		.hit_OUT(hit_OUT), 
		.readData1_OUT(readData1_OUT), 
		.readData2_OUT(readData2_OUT), 
		.signExImmediate_OUT(signExImmediate_OUT), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp), 
		.RegDst_OUT(RegDst_OUT), 
		.ALUSrc_OUT(ALUSrc_OUT), 
		.MemtoReg_OUT(MemtoReg_OUT), 
		.RegWrite_OUT(RegWrite_OUT), 
		.MemRead_OUT(MemRead_OUT), 
		.MemWrite_OUT(MemWrite_OUT), 
		.Branch_OUT(Branch_OUT), 
		.ALUOp_OUT(ALUOp_OUT), 
		.rt(rt), 
		.rd(rd), 
		.funct(funct), 
		.nextPc(nextPc), 
		.rt_OUT(rt_OUT), 
		.rd_OUT(rd_OUT), 
		.funct_OUT(funct_OUT), 
		.nextPc_OUT(nextPc_OUT)
	);
	
	initial 
	begin
		clk = 0;
		hit = 0;
		readData1 = 0;
		readData2 = 0;
		signExImmediate = 0;
		RegDst = 0;
		ALUSrc = 0;
		MemtoReg = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 0;
		ALUOp = 0;
		rt = 0;
		rd = 0;
		funct = 0;
		nextPc = 0;
	end
	
	always #25 clk = ~clk;

	initial begin
		#200;
		hit = 1;
		readData1 = 32'b1;
		readData2 = 32'b10;
		signExImmediate = 32'b11;
		RegDst = 1;
		ALUSrc = 1;
		MemtoReg = 1;
		RegWrite = 1;
		MemRead = 1;
		MemWrite = 1;
		Branch = 1;
		ALUOp = 3'b100;
		rt = 32'b101;
		rd = 32'b110;
		funct = 6'b111;
		nextPc = 32'b1000;
        


	end
      
endmodule

