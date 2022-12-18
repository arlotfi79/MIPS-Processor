`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:32:47 11/26/2021 
// Design Name: 
// Module Name:    controlUnit 
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
module controlUnit(
	input [5:0] OpCode,
	output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
	output [2:0] ALUOp
    );
	
	// -----------------------Based on the table provided in slides------------------------
	
	assign RegDst = (OpCode == 6'b000000) ? 1 : 0;
	
	assign ALUSrc = (OpCode == 6'b000000 || OpCode == 6'b000110) ? 0 : 1;
	
	assign MemtoReg = (OpCode == 6'b000100) ? 1 : 0;
	
	assign RegWrite = (OpCode == 6'b000101 || OpCode == 6'b000110) ? 0 : 1;
	
	assign MemRead = (OpCode == 6'b000100) ? 1 : 0;
	
	assign MemWrite = (OpCode == 6'b000101) ? 1 : 0;
	
	assign Branch = (OpCode == 6'b000110) ? 1 : 0;
	
	assign  ALUOp[0] = (OpCode == 6'b000000  || OpCode == 6'b000001 ) ? 0 : 1 ;
	
   assign  ALUOp[1] = (OpCode == 6'b000000 || OpCode == 6'b000110 ) ? 0 : 1;
	
	assign  ALUOp[2] = 0;

endmodule
