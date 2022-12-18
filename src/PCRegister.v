`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:44 10/15/2021 
// Design Name: 
// Module Name:    PCRegister 
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
module PCRegister #(localparam SIZE = 32)(
	input clk, hit,
	input [SIZE-1:0] nextPC,
	output reg [SIZE-1:0] outPC = 0
    );
	 
	 always @(negedge clk)
	 begin
		if (hit)
			outPC = nextPC;
	 end

	

endmodule
