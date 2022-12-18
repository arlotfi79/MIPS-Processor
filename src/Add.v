`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:43 10/28/2021 
// Design Name: 
// Module Name:    Add 
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
module Add #(localparam SIZE = 32)(
	input [SIZE-1:0] in,
	output reg [SIZE-1:0] out = 0
    );
	 
	always @(in)
	begin
		out = in + 4;
	end


endmodule
