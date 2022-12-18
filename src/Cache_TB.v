`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:12:10 10/29/2021
// Design Name:   Cache
// Module Name:   C:/Alireza/CALab/Homework1/Cache_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Cache
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Cache_TB;

	// Inputs
	reg clk;
	reg [127:0] dataLine;
	reg [31:0] address;

	// Outputs
	wire hit;
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	Cache uut (
		.clk(clk), 
		.dataLine(dataLine), 
		.address(address), 
		.hit(hit), 
		.instruction(instruction)
	);
	
	initial
	begin
		clk = 0;
	end
	
	always #25 clk = ~clk; 
	initial begin
	#5
	dataLine = 128'h0000000000000000000000000000000A;
	address = 32'b00000000000000000000000001011100;
	//                                     ###**
	
	#50
	dataLine = 128'h0000000000000000000000000000000B;
	address = 32'b00000000000000000000000001011100;
	//                                     ###**
	
	#50
	dataLine = 128'h0000000000000000000000000000000C;
	address = 32'b00000000000000000000000001111100;
	//                                     ###**
	end
      
endmodule

