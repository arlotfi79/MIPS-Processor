`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:40 12/16/2021 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory #(localparam SIZE = 32)(
   input clk,
	input [SIZE-1:0] address,
	input [SIZE-1:0] writeData,
	input MemRead,
	input MemWrite,
	
	output reg [SIZE-1:0] readData = 0
    );


	reg [SIZE-1:0] memory [1023:0];

	always @ (posedge clk)
	begin
        if (MemWrite==1) 
			memory[address] = writeData [31:0];
			
		if (MemRead==1) 
			readData [31:0] = memory[address];
	end
	
endmodule
