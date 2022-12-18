`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:33:38 10/15/2021 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory # (localparam SIZE = 32, localparam SIZE_OUT = 128, localparam SIZE_MEM = 1024)(
	input [SIZE-1:0] address,
	input clk,
	output reg [SIZE_OUT-1:0]dataLine
	);
	

    // memory intialization
   reg [7:0] memory [0:SIZE_MEM-1];
	integer i;
	initial begin	
		for (i=0 ; i<SIZE_MEM ; i=i+1)
		begin
			memory[i] = 8'b11110000;
		end
	end
	 
	 
	 // instruction prepration
   integer count = 0;
	reg [SIZE-1:0] addrMem;
	reg [SIZE-5:0] check;
	
	always @(posedge clk) 
	begin
		// first check if we have the same address
		if(check!=address[SIZE-1:4]) 
		begin
			$display("Error in instruction memory dataLine");
			dataLine = 128'bX; // mark as invalid
			count = 0; // reset counter
			check = address[SIZE-1:4];
		end
			
      // output dataLine if we're on the 5th continous clk
		else if(count == 5)
		begin	 
			 addrMem = {address[31:4] , 4'b0} ;
			 // concatinate data from memory => 16 * 8 bit = 128 bit
			 dataLine = {memory[addrMem+15],memory[addrMem+14],memory[addrMem+13],memory[addrMem+12],
							 memory[addrMem+11],memory[addrMem+10],memory[addrMem+9],memory[addrMem+8],
							 memory[addrMem+7],memory[addrMem+6],memory[addrMem+5],memory[addrMem+4],
							 memory[addrMem+3],memory[addrMem+2],memory[addrMem+1],memory[addrMem]} ;
			 count = 0; // reset counter
		end

		else
			count = count + 1;

		// save for next time
		check = address[31:4];
			
	end
	
endmodule
