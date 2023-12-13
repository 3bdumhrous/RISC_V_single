module testbench();
	reg clk;
	reg reset;
	wire [31:0] WriteData, DataAdr, PC;
	wire MemWrite;
// instantiate device to be tested
	top dut(clk, reset, WriteData, DataAdr, MemWrite, PC);
// initialize test
	initial
		begin
			reset <= 1; # 22; reset <= 0;
		end
// generate clock to sequence tests
	always
		begin
			clk <= 1; # 5; clk <= 0; # 5;
		end
// check results
	always @(negedge clk)
		begin
			if(MemWrite) begin
				if(DataAdr === 32'h61 & WriteData === 32'h25) begin
					$display("Simulation succeeded");
				end 

			end
			if(PC === 32'h5C) $display("PROGRAM COMPLETE");
		end
endmodule
