`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:42:47 10/29/2021
// Design Name:   Fetch
// Module Name:   C:/Alireza/CALab/Homework1/Fetch_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fetch_TB;

	// Inputs
	reg clk;
	reg [31:0] BranchTarget;
	reg PcSrc;

	// Outputs
	wire hit;
	wire [31:0] instruction;
	wire [31:0] nextPc;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.clk(clk), 
		.BranchTarget(BranchTarget), 
		.PcSrc(PcSrc), 
		.hit(hit), 
		.instruction(instruction), 
		.nextPc(nextPc)
	);
	
	
	initial begin
		clk = 0;
		BranchTarget = 0;
		PcSrc = 0;
	end
	
	always #25 clk = ~clk; 
	initial begin
		
		

	end
      
endmodule

