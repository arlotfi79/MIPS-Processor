`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:02 12/16/2021 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM #(localparam SIZE=32)(
   input clk,
	input hit,
	input [SIZE-1:0] branchTarget,
	input zeroFlag,
	input [SIZE-1:0] ALUResult,
   input [SIZE-1:0] readData2,
	input [4:0] writeReg, 
	input MemRead, 
	input MemWrite, 
   input Branch,
	input RegWrite,
	input MemToReg,
    
   output reg [SIZE-1:0] branchTarget_Out = 0,
	output reg zeroFlag_Out = 0,
	output reg [SIZE-1:0] ALUResult_Out = 0,
	output reg [SIZE-1:0] readData2_Out = 0,
	output reg [4:0] writeReg_Out = 0,
	output reg MemRead_Out = 0, 
	output reg MemWrite_Out = 0, 	
	output reg Branch_Out = 0,
	output reg RegWrite_Out = 0,
	output reg MemToReg_Out = 0,
	output hit_Out
  );
  
  assign hit_Out = hit;
  
  always @ (negedge clk)
  begin
    if (hit)
    begin
        branchTarget_Out <= branchTarget;
        zeroFlag_Out <= zeroFlag;
        ALUResult_Out <= ALUResult;  
        readData2_Out <= readData2;  
        writeReg_Out <= writeReg;  
        MemRead_Out <= MemRead; 
        MemWrite_Out <= MemWrite;  
        Branch_Out <= Branch;  
        RegWrite_Out <= RegWrite;  
        MemToReg_Out <= MemToReg;  
    end
  end

endmodule
