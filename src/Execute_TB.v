`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:35:45 12/07/2021
// Design Name:   Execute
// Module Name:   C:/Alireza/CALab/Homework1/Execute_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Execute_TB;

	// Inputs
	reg clk;
	reg [31:0] ALUReadData1;
	reg [31:0] ALUReadData2;
	reg [31:0] immediate;
	reg [5:0] funct;
	reg [2:0] ALUOp;
	reg ALUSrc;

	// Outputs
	wire [31:0] ALUResult;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clk(clk), 
		.ALUReadData1(ALUReadData1), 
		.ALUReadData2(ALUReadData2), 
		.immediate(immediate), 
		.funct(funct), 
		.ALUOp(ALUOp), 
		.ALUSrc(ALUSrc), 
		.ALUResult(ALUResult), 
		.zero(zero)
	);

	initial begin
		clk = 0;
		ALUReadData1 = 32'b111;
		ALUReadData2 = 32'b110;
		immediate = 32'b101;
		ALUOp = 0;
	end

	always #25 clk = ~clk; 
	initial begin
	
		ALUSrc = 0;
		funct = 6'b1; // SUB
		
		#200;
		ALUSrc = 1;
		funct = 6'b1; // SUB
		
		#200;
		ALUSrc = 0;
		funct = 6'b000110; // LSR (temporarily 1 bit)
        
        

	end
      
endmodule

