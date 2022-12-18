`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:57:19 11/26/2021
// Design Name:   IF_ID
// Module Name:   C:/Alireza/CALab/Homework1/IF_ID_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_ID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IF_ID_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] nextPC;
	reg [31:0] instruction;

	// Outputs
	wire hitOut;
	wire [31:0] nextPCOut;
	wire [31:0] instructionOut;

	// Instantiate the Unit Under Test (UUT)
	IF_ID uut (
		.clk(clk), 
		.hit(hit), 
		.nextPC(nextPC), 
		.instruction(instruction), 
		.hitOut(hitOut), 
		.nextPCOut(nextPCOut), 
		.instructionOut(instructionOut)
	);
	
	initial 
	begin
		clk = 0;
		nextPC = 32'b0;
		instruction = 32'b0;
	end

	always #25 clk = ~clk;
	
	initial begin
		hit = 0;
		nextPC = 32'b00000000000000000000000000000001;
		instruction = 32'b00000000000000000000000000000010;

		#200;
		hit = 1;
		nextPC = 32'b00000000000000000000000000000010;
		instruction = 32'b00000000000000000000000000000011;
		
		#200;
		hit = 0;
		nextPC = 32'b00000000000000000000000000000011;
		instruction = 32'b00000000000000000000000000000100;
        
		// Add stimulus here

	end
      
endmodule

