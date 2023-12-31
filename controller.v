module controller (
	input  [6:0] op,
	input  [2:0] funct3,
	input  funct7b5,
	input  Zero,
	output  [1:0] ResultSrc,
	output  MemWrite,
	output  PCSrc, ALUSrc,
	output  RegWrite, Jump,
	output  [1:0] ImmSrc,
	output  [2:0] ALUControl,
	output  JumpSel
);
	wire [1:0] ALUOp;
	wire Branch;
	maindec md(op, ResultSrc, MemWrite, Branch,
		ALUSrc, RegWrite, Jump, ImmSrc, ALUOp, JumpSel);
	aludec ad(op[5], funct3, funct7b5, ALUOp, ALUControl);
	assign PCSrc = (Branch & Zero & !funct3[0]) | Jump | (Branch & !Zero & funct3[0]) | JumpSel;
endmodule
