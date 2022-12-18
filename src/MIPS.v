`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:58:34 11/26/2021 
// Design Name: 
// Module Name:    MIPS 
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
module MIPS #(localparam SIZE = 32)(
	input clk
    );
	 
	 // ************************* Variables *************************
	// ###### FETCH ######
	wire hit_FETCH;
	wire [SIZE-1:0] instruction_FETCH;
	wire [SIZE-1:0] nextPc_FETCH;
	
	// pc source comes from data memory segment
	wire PcSrc_FromDM;
	 
	// ###### IF/ID ######
	wire hit_IFID;
	wire [SIZE-1:0] nextPc_IFID;
	wire [SIZE-1:0] instruction_IFID;
	wire hitOut_IFID;
	wire [SIZE-1:0] nextPCOut_IFID;
	wire [SIZE-1:0] instructionOut_IFID;
	
	// ###### DECODE ######
	wire [SIZE-1:0] instruction_DEC;
	wire [5:0] Opcode_DEC;
	wire [SIZE-1:0] ReadData1_DEC;
	wire [SIZE-1:0] ReadData2_DEC;
	wire [SIZE-1:0] SignExtended_DEC;
	wire [4:0] Rt_DEC;
	wire [4:0] Rd_DEC;
	
	// ###### CONTROL UNIT ######
	wire [5:0] Opcode_CU;
	wire RegDst_CU;
	wire ALUSrc_CU;
	wire MemtoReg_CU;
	wire RegWrite_CU;
	wire MemRead_CU;
	wire MemWrite_CU;
	wire Branch_CU;
	wire [2:0] ALUOp_CU;
	
	// ###### ID/EX ######
	 wire hitOut_IDEX;
    wire [SIZE-1:0] readData1_IDEX;
    wire [SIZE-1:0] readData2_IDEX;
    wire [SIZE-1:0] signExImmediate_IDEX;
    wire RegDst_IDEX;
    wire ALUSrc_IDEX;
    wire MemtoReg_IDEX;
    wire RegWrite_IDEX;
    wire MemRead_IDEX;
    wire MemWrite_IDEX;
    wire Branch_IDEX;
    wire [2:0] ALUOp_IDEX;
    wire [4:0] Rt_IDEX;
    wire [4:0] Rd_IDEX;
    wire [5:0] funct_IDEX;
    wire [SIZE-1:0] nextPc_IDEX;
	 
	// ###### EXECUTE ######
	wire [SIZE-1:0] ALUResult_EXECUTE;
	wire zero_EXECUTE;
	// branch
	wire [SIZE-1:0] branchTarget_EXECUTE;
	// mux5bit
	wire [4:0] MuxOut_EXECUTE;
	
	// ###### EX/MEM ######
	wire hit_EXMEM;
	wire [SIZE-1:0] branchTarget_EXMEM;
	wire zeroFlag_EXMEM;
	wire [SIZE-1:0] ALUResult_EXMEM;
	wire [SIZE-1:0] readData2_EXMEM;
	wire [4:0] writeReg_EXMEM;
	wire MemRead_EXMEM;
	wire MemWrite_EXMEM;
	wire Branch_EXMEM;
	wire RegWrite_EXMEM;
	wire MemToReg_EXMEM;
	
	// ###### DATA MEM ######
	wire [31:0] readData_DATAMEMORY;
	 
	// ###### MEM/WR ######
	 wire [SIZE-1:0] readData_MEMWB;
	 wire [SIZE-1:0] ALUResult_MEMWB;
	 wire [4:0] writeReg_MEMWB;
	 wire RegWrite_MEMWB;
	 wire MemToReg_MEMWB;
	 wire hit_MEMWB;
	 
	 // ###### WRITE BACK ######
	wire [SIZE-1:0] writeData_WB;



	 // ************************* Connections *************************

	// ###### Fetch ######
	assign PcSrc_FromDM = (Branch_EXMEM=== 1'bx || zeroFlag_EXMEM === 1'bx)? 0: Branch_EXMEM & zeroFlag_EXMEM;
	
	Fetch fetch (
		 .clk(clk), 
		 .BranchTarget(branchTarget_EXMEM), 
		 .PcSrc(PcSrc_FromDM), 
		 .hit(hit_FETCH), 
		 .instruction(instruction_FETCH), 
		 .nextPc(nextPc_FETCH)
		 );
		 
		
	// ###### IF/ID ######
	assign instruction_IFID = instruction_FETCH;
	assign nextPc_IFID = nextPc_FETCH;
	assign hit_IFID = hit_FETCH;

	IF_ID If_Id (
		 .clk(clk), 
		 .hit(hit_FETCH), 
		 .nextPC(nextPc_IFID), 
		 .instruction(instruction_IFID), 
		 .hitOut(hitOut_IFID), 
		 .nextPCOut(nextPCOut_IFID), 
		 .instructionOut(instructionOut_IFID)
		 );
	
	// ###### Decode ######
	assign instruction_DEC = instructionOut_IFID;
	
	Decode decode (
		 .clk(clk), 
		 .instruction(instruction_DEC), 
		 .regWrite(RegWrite_MEMWB),
		 .writeReg(writeReg_MEMWB),
		 .writeData(writeData_WB),
		 .opCode(Opcode_DEC), 
		 .readData1(ReadData1_DEC), 
		 .readData2(ReadData2_DEC), 
		 .signExtendedImmidiate(SignExtended_DEC), 
		 .rt(Rt_DEC), 
		 .rd(Rd_DEC)
		 );
		 
		 
	// ###### Control unit ######
	assign Opcode_CU = Opcode_DEC;
	
	controlUnit control (
		 .OpCode(Opcode_CU), 
		 .RegDst(RegDst_CU), 
		 .ALUSrc(ALUSrc_CU), 
		 .MemtoReg(MemtoReg_CU), 
		 .RegWrite(RegWrite_CU), 
		 .MemRead(MemRead_CU), 
		 .MemWrite(MemWrite_CU), 
		 .Branch(Branch_CU), 
		 .ALUOp(ALUOp_CU)
		 );
		 
	// ###### ID/EX ######
    
	ID_EX Id_Ex (
    .clk(clk), 
    .hit(hit_FETCH), 
    .readData1(ReadData1_DEC), 
    .readData2(ReadData2_DEC), 
    .signExImmediate(SignExtended_DEC), 
    .hit_OUT(hitOut_IDEX), 
    .readData1_OUT(readData1_IDEX), 
    .readData2_OUT(readData2_IDEX),
    .signExImmediate_OUT(signExImmediate_IDEX),
    .RegDst(RegDst_CU), 
    .ALUSrc(ALUSrc_CU), 
    .MemtoReg(MemtoReg_CU), 
    .RegWrite(RegWrite_CU), 
    .MemRead(MemRead_CU), 
    .MemWrite(MemWrite_CU), 
    .Branch(Branch_CU), 
    .ALUOp(ALUOp_CU), 
    .RegDst_OUT(RegDst_IDEX),
    .ALUSrc_OUT(ALUSrc_IDEX), 
    .MemtoReg_OUT(MemtoReg_IDEX), 
    .RegWrite_OUT(RegWrite_IDEX), 
    .MemRead_OUT(MemRead_IDEX), 
    .MemWrite_OUT(MemWrite_IDEX), 
    .Branch_OUT(Branch_IDEX),
    .ALUOp_OUT(ALUOp_IDEX), 
    .rt(Rt_DEC), 
    .rd(Rd_DEC), 
    .funct(SignExtended_DEC[5:0]), 
    .nextPc(nextPCOut_IFID), 
    .rt_OUT(Rt_IDEX), 
    .rd_OUT(Rd_IDEX), 
    .funct_OUT(funct_IDEX), 
    .nextPc_OUT(nextPc_IDEX)
    );
	
	// ###### Execute ######
	
	Execute execute (
    .clk(clk), 
    .ALUReadData1(readData1_IDEX), 
    .ALUReadData2(readData2_IDEX), 
    .immediate(signExImmediate_IDEX), 
    .funct(funct_IDEX), 
    .ALUOp(ALUOp_IDEX), 
    .ALUSrc(ALUSrc_IDEX), 
    .ALUResult(ALUResult_EXECUTE), 
    .zero(zero_EXECUTE)
    );
	 
	 // branch
	 assign branchTarget_EXECUTE = (signExImmediate_IDEX << 2) + nextPc_IDEX;
	 // mux5bit
    assign MuxOut_EXECUTE = (RegDst_IDEX) ? Rt_IDEX : Rd_IDEX;
	 
	 // ###### EX/MEM ######
	
	EX_MEM Ex_Mem (
	 .clk(clk), 
	 .hit(hit_FETCH), 
	 .branchTarget(branchTarget_EXECUTE), 
	 .zeroFlag(zero_EXECUTE), 
	 .ALUResult(ALUResult_EXECUTE), 
	 .readData2(readData2_IDEX), 
	 .writeReg(MuxOut_EXECUTE), 
	 .MemRead(MemRead_IDEX), 
	 .MemWrite(MemWrite_IDEX), 
	 .Branch(Branch_IDEX), 
	 .RegWrite(RegWrite_IDEX), 
	 .MemToReg(MemtoReg_IDEX), 
	 .branchTarget_Out(branchTarget_EXMEM), 
	 .zeroFlag_Out(zeroFlag_EXMEM), 
	 .ALUResult_Out(ALUResult_EXMEM), 
	 .readData2_Out(readData2_EXMEM), 
	 .writeReg_Out(writeReg_EXMEM), 
	 .MemRead_Out(MemRead_EXMEM), 
	 .MemWrite_Out(MemWrite_EXMEM), 
	 .Branch_Out(Branch_EXMEM), 
	 .RegWrite_Out(RegWrite_EXMEM), 
	 .MemToReg_Out(MemToReg_EXMEM), 
	 .hit_Out(hit_EXMEM)
	 );

	 // ###### DataMemory ######
	
	DataMemory dataMemory (
    .clk(clk), 
    .address(ALUResult_EXMEM), 
    .writeData(readData2_EXMEM), 
    .MemRead(MemRead_EXMEM), 
    .MemWrite(MemWrite_EXMEM), 
    .readData(readData_DATAMEMORY)
    );

	 // ###### MEM/WB ######
	 
	 MEM_WB Mem_Wb (
    .clk(clk), 
    .hit(hit_FETCH), 
    .readData(readData_DATAMEMORY), 
    .ALUResult(ALUResult_EXMEM), 
    .writeReg(writeReg_EXMEM), 
    .RegWrite(RegWrite_EXMEM), 
    .MemToReg(MemToReg_EXMEM), 
    .hit_OUT(hit_MEMWB), 
    .readData_OUT(readData_MEMWB), 
    .ALUResult_OUT(ALUResult_MEMWB), 
    .writeReg_OUT(writeReg_MEMWB), 
    .RegWrite_OUT(RegWrite_MEMWB), 
    .MemToReg_OUT(MemToReg_MEMWB)
    );
	 // ###### WriteBack ######
	
	WriteBack writeBack (
    .MemToReg(MemToReg_MEMWB), 
    .readData(readData_MEMWB), 
    .ALUResult(ALUResult_MEMWB), 
    .writeData(writeData_WB)
    );


endmodule
