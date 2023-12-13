module top (
	input  clk, reset,
	output  [31:0] WriteData, DataAdr,
	output  MemWrite,
	output [31:0] PC
);
	wire [31:0] Instr, ReadData;
// instantiate processor and memories
	riscvsingle rvsingle(clk, reset, PC, Instr, MemWrite,
		DataAdr, WriteData, ReadData);
	imem imem(PC, Instr);
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule
