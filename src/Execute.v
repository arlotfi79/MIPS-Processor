`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:03 12/07/2021 
// Design Name: 
// Module Name:    Execute 
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
module Execute #(localparam SIZE =32)(
	input clk,
	input [SIZE-1:0] ALUReadData1,
	input [SIZE-1:0] ALUReadData2,
	input [SIZE-1:0] immediate,
	input [5:0] funct,
	input [2:0] ALUOp,
	input ALUSrc,
	
	output [SIZE-1:0] ALUResult,
	output zero
    );
	 
	 
	 wire [SIZE-1:0] ALUInput2;
	 Mux32bit mux (
    .a(immediate), 
    .b(ALUReadData2), 
    .sel(ALUSrc), 
    .out(ALUInput2)
    );


	 wire [3:0] ALUcnt;
	 ALUControlUnit aluControl (
    .ALUOp(ALUOp), 
    .Function(funct), 
    .ALUcnt(ALUcnt)
    );

	 
	 wire [4:0] shamt;
	 assign shamt = 4'b1; /////////////////// temporarily ///////////////
	 ALU alu (
    .input1(ALUReadData1), 
    .input2(ALUInput2), 
    .ALUCnt(ALUcnt), 
    .shamt(shamt), 
    .result(ALUResult), 
    .zero(zero)
    );



endmodule
