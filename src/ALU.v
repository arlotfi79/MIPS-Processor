`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:59 12/07/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU #(localparam SIZE = 32)(
	input [SIZE-1:0] input1,
	input [SIZE-1:0] input2,
	input [3:0] ALUCnt,
	input [4:0] shamt,
	
	output [SIZE-1:0] result,
	output zero
	);


	assign result = ALUCnt == 4'b0000 ? input1 + input2:
						 ALUCnt == 4'b0001 ? input1 - input2:
						 ALUCnt == 4'b0010 ? ~input1:
						 ALUCnt == 4'b0011 ? input1 <<  shamt:
						 ALUCnt == 4'b0100 ? input1 >>  shamt:
						 ALUCnt == 4'b0101 ? input1 & input2:
						 ALUCnt == 4'b0110 ? input1 | input2:
						 ALUCnt == 4'b0111 ? (input1 < input2 ? 1:0) : 32'bz;
	
	// checking the result to set zero flag
	reg zeroTest;
	always @(*)
	begin
		if (result == 0)
			zeroTest = 1;
		else
			zeroTest = 0;
	end
	
	assign zero = (zeroTest == 1) ? 1 : 0;

endmodule
