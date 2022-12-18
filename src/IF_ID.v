`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:50:58 11/26/2021 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID #(localparam SIZE = 32)(
	input clk, hit,
	input [SIZE-1:0] nextPC,
	input [SIZE-1:0] instruction,
	
	output  hitOut,
	output reg[SIZE-1:0] nextPCOut = 0,
	output reg[SIZE-1:0] instructionOut = 0
    );
	
	
	always @(negedge clk) 
	begin
		if (hit)
		begin
			nextPCOut = nextPC;
			instructionOut = instruction;
		end
		
	end
	
	assign hitOut = hit;
	

endmodule
