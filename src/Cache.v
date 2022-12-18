`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:31 10/28/2021 
// Design Name: 
// Module Name:    Cache 
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
module Cache # (localparam SIZE = 32, localparam SIZE_DATA = 128)(
   input clk,
	input [SIZE_DATA-1:0] dataLine,
	input [SIZE-1:0] address, // pc address
	
	output reg hit = 1'bz,
	output reg [SIZE-1:0] instruction = 32'bz
);
	
	// Intialize cache 
   reg [153:0] cache [7:0];
	integer i;
	initial begin	
		for (i=0 ; i<8 ; i=i+1)
		begin
			cache[i] = i;
		end
	end
	
	// prepare important data with any change in signal
	reg [2:0] index;
	reg [1:0] offset;
	reg isValid;
	reg [24:0] lastPc;
	
	always @ (*)
	begin
		index = address[6:4];
		offset = address[3:2];
		isValid = cache[index][153];	// check the valid bit
		lastPc = cache[index][152:128];	// save last pc
	end
	
	// read from cache
	always@(posedge clk)
	begin
		
		// check if we can read
		if (lastPc == address[31:7] &&  isValid == 1)
		begin
			hit = 1;
			
			if (offset == 2'b00)
				instruction = cache[index][31:0];
			else if(offset == 2'b01)
				instruction = cache[index][63:32];
			else if(offset == 2'b10)
				instruction = cache[index][95:64];
			else if(offset == 2'b11)
				instruction = cache[index][127:96];
		end
		
		// if not
		else
		begin
			hit= 0;
			instruction = 32'bx;	// mark as invalid
		end
		
	end
	
	
	// write on cache
	always@(dataLine)
	begin
		// if we have the appropriate data, put it on cache
		if(dataLine !== 128'bx)
		begin
			cache[index][127:0] = dataLine;  // data from 0-127
			cache[index][152:128] = address[31:7]; // pc from 128-152
			cache[index][153] = 1; // now set valid bit = 1
		end
	end

endmodule
