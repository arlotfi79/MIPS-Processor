`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:13 11/01/2021 
// Design Name: 
// Module Name:    Decode 
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
module Decode #(localparam SIZE=32)(
	input clk,
	input [SIZE-1:0] instruction,
	input regWrite,
	input [4:0] writeReg,
	input [SIZE-1:0] writeData,
	
	output reg [5:0] opCode = 0,
	output reg [SIZE-1:0] readData1 = 0,
	output reg [SIZE-1:0] readData2 = 0,
	output reg [SIZE-1:0] signExtendedImmidiate = 0,
	output reg [4:0] rt = 0,
	output reg [4:0] rd = 0
    );
	 
	reg [5:0] OP;
	reg [4:0] RS;
	reg [4:0] RT;
	reg [4:0] RD;
	reg [15:0] IMM;
	
	// prepare needed parts at posedge
	always @(posedge clk)
	begin
			RS= instruction[25:21];  // source reg
			RT = instruction[20:16]; // temp reg 
			RD = instruction[15:11]; // dest reg
			IMM = instruction[15:0]; // immidiate
	end
	 
	
	// register file
	wire [SIZE-1:0] ReadD1;
	wire [SIZE-1:0] ReadD2;
	RegisterFile registerFile (
		 .regWrite(regWrite),
		 .clk(clk), 
		 .writeReg(writeReg), 
		 .writeData(writeData), 
		 .readReg1(RS), 
		 .readData1(ReadD1), 
		 .readReg2(RT), 
		 .readData2(ReadD2)
		 );
		 
	// sign extend
	wire [SIZE-1:0] signExtend;
	SignExtend signExtended (
		 .immediate(IMM), 
		 .signExtend(signExtend)
		 );
	
	// output at posedge
	always @(posedge clk)
	begin
		opCode = instruction[31:26]; 				// opcode
		readData1 = ReadD1;			  				// read data 1
		readData2 = ReadD2;			  				// read data 2
		signExtendedImmidiate = signExtend;    // sign extended
		rd = RD;
		rt = RT;
	end

endmodule
