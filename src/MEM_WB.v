`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:21 12/16/2021 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB #(localparam SIZE = 32)(
   input clk,
	input hit,
	input [SIZE-1:0] readData,
	input [SIZE-1:0] ALUResult,
	input [4:0] writeReg,
	input RegWrite,	
	input MemToReg,

	output hit_OUT,
	output reg [SIZE-1:0] readData_OUT = 0,
	output reg [SIZE-1:0] ALUResult_OUT = 0,
	output reg [4:0] writeReg_OUT = 0,
	output reg RegWrite_OUT = 0,
	output reg MemToReg_OUT = 0
    );

	assign hit_OUT = hit;
	
	always @ (negedge clk)
	begin
		if (hit)
		begin
			readData_OUT = readData;
			ALUResult_OUT = ALUResult_OUT;
			writeReg_OUT = writeReg_OUT;
			RegWrite_OUT = RegWrite_OUT;
			MemToReg_OUT = MemToReg_OUT;
		end
	end
endmodule
