module alu (
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUcontrol,
    output zero,
    output reg [31:0] ALUResult
);

    always @(*) begin
        case (ALUcontrol)
            3'b000: ALUResult = SrcA + SrcB ;        // Addition
            3'b001: ALUResult = SrcA - SrcB ;       // Subtraction
            3'b010: ALUResult = SrcA & SrcB ;      // Bitwise AND
            3'b011: ALUResult = SrcA | SrcB ;      // Bitwise OR
            3'b101: ALUResult = (SrcA < SrcB) ? 1 : 0; // Set if less than (SLT)
            default: ALUResult = 32'bx;         // Default: Zero output
        endcase
    end

    assign zero = (ALUResult == 32'b0) ? 1'b1 : 1'b0;

endmodule

