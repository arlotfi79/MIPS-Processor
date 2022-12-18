`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:43 10/28/2021 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch #(localparam SIZE = 32)(
	input clk,
	input [SIZE-1:0] BranchTarget,
	input PcSrc,
	
	output reg hit = 0,
	output reg [SIZE-1:0] instruction = 0,
	output reg [SIZE-1:0] nextPc = 0
    );
	 
	 // Mux
	wire [SIZE-1:0] muxToPc; 
	 
	 // PCReg
	wire hitPcAndCache;
	wire [SIZE-1:0] outPC;
	
	 // Add
	wire [SIZE-1:0] addToMux;
	 
	// Instruction Memory
	wire [127:0] dataLine;
	
	// Cache
	wire [SIZE-1:0] instructionCache;
	 

	Mux32bit mux32bit (
		.a(addToMux),
		.b(BranchTarget), 
		.sel(PcSrc), 
		.out(muxToPc)
		);
	
	PCRegister pcRegister (
		.clk(clk), 
		.hit(hitPcAndCache), 
		.nextPC(muxToPc), 
		.outPC(outPC)
		);
		
	Add add (
		.in(outPC), 
		.out(addToMux)
		);
	
	InstructionMemory instructionMemory (
		.address(outPC), 
		.clk(clk), 
		.dataLine(dataLine)
		);
		
	Cache cache (
		.clk(clk), 
		.dataLine(dataLine), 
		.address(outPC), 
		.hit(hitPcAndCache), 
		.instruction(instructionCache)
		);
		
	// if any output wanted to change --> update
	always @ (hitPcAndCache or instructionCache or addToMux)
	begin
		assign instruction = instructionCache;
		assign hit = hitPcAndCache;
		assign nextPc = addToMux;
	end	
	
endmodule
