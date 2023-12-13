module imem (
    input [31:0] a,
    output [31:0] rd
);
    reg [31:0] ROM[255:0]; // 1KB memory (256 words)

    initial
        $readmemh("riscvtest.txt", ROM);

    assign rd = ROM[a[9:2]]; // word accessible
endmodule
