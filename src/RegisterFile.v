`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:07 11/01/2021 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
	input regWrite, clk,
	
	input [4:0] writeReg,
	input [31:0] writeData,
	
	input [4:0] readReg1,
	output [31:0] readData1,
	
	input [4:0] readReg2,
	output [31:0] readData2
    );
	 
	 reg [31:0] regFile  [31:0];
    integer i;
	 
    initial begin
        for (i = 0; i < 32; i = i +1) 
            regFile[i] = 32'b1;
    end
	 
	 // register[0] must be 0
	 initial regFile[0] = 0; 
	 
	 // read data
	 assign readData1 = regFile[readReg1];
	 assign readData2 = regFile[readReg2];
	 
	 // write data
	 always @(posedge clk) 
    begin
        if (regWrite == 1)
        begin
            if (writeReg == 0)
                $display ("Can NOT change zero register");
				else 	
                regFile[writeReg] = writeData;
			end
	 end
	 

endmodule
