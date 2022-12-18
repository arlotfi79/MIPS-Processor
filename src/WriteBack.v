`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:57 12/16/2021 
// Design Name: 
// Module Name:    WriteBack 
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
module WriteBack #(localparam SIZE = 32)(
	input MemToReg,
	input [SIZE-1:0] readData,
	input [SIZE-1:0] ALUResult,

	 
	output [SIZE-1:0] writeData
    );
	 
	 Mux32bit muxWB (
		 .a(ALUResult), // input 0
		 .b(readData), // input 1
		 .sel(MemToReg), 
		 .out(writeData)
		 );


endmodule
