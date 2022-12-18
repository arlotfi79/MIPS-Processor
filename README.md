# MIPS Processor
In this project, a 32-bit multi-cycle MIPS processor that supports exceptions is implemented in Verilog HDL.
This project was designed by the TA team for the Computer Architecture Lab course (Fall 2021).

# Goals
1. This machine is designed to be able to execute a variety of instructions in a multicycle implementation.
2. The multicycle processor should support two types of exceptions: undefined instructions and arithmetic overflow.

# Implementation

The multicycle implementation breaks instructions down into multiple steps. These steps typically are the:
1. Instruction fetch step
2. Instruction decode and Register fetch step
3. Execution, memory address computation, or branch completion step 
4. Memory access or R-type instruction completion step
5. Memory read completion step

In each short step, the processor can read or write the memory or register file or use the ALU. Different instructions use different numbers of steps, so simpler instructions can complete faster than more complex ones. The processor needs only one adder; this adder is reused for different purposes on various steps. And the processor uses a combined memory for instructions and data. The instruction is fetched from memory on the first step, and data may be read or written on later steps.
we add nonarchitectural state elements to hold intermediate results between the steps.
