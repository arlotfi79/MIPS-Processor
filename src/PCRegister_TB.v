`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:12:16 10/15/2021
// Design Name:   PCRegister
// Module Name:   C:/Alireza/CALab/Homework1/PCRegister_TB.v
// Project Name:  Homework1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCRegister_TB;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] nextPC;

	// Outputs
	wire [31:0] outPC;

	// Instantiate the Unit Under Test (UUT)
	PCRegister uut (
		.clk(clk), 
		.nextPC(nextPC), 
		.hit(hit),
		.outPC(outPC)
	);
	
	initial begin
		clk = 0;
		hit = 1'bx;
	end

	always #25 clk = ~clk; 
	
	initial begin
		// Initialize Inputs
		
		# 15
		nextPC = 32'b00000000000000000000000000001010;
		hit = 0;
		
		# 25
		nextPC = 32'b00000000000000000000000000001011;
		hit = 1;
		
		# 25
		nextPC = 32'b00000000000000000000000000001100;
		hit = 0;
		
        
		// Add stimulus here

	end
      
endmodule

