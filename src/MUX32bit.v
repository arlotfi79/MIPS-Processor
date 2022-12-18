`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:36 10/15/2021 
// Design Name: 
// Module Name:    MUX32bit 
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
module Mux32bit #(localparam SIZE = 32)(	 
	 input [SIZE-1:0] a,
	 input [SIZE-1:0] b,
	 input sel,
	 output [SIZE-1:0] out
    );
	 
	assign out = (sel) ? b : a;
	
endmodule
