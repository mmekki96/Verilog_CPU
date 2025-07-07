`timescale 1ns/1ps

module tb_alu;

reg [3:0] in1_tb;
reg [3:0] in2_tb;
reg [2:0] sel_tb;
wire [3:0] out_tb;

alu UUT (
	.in1 (in1_tb),
	.in2 (in2_tb),
	.sel (sel_tb),
	.out (out_tb)
	);

	initial begin
		$dumpfile("alu.vcd");
		$dumpvars(0, tb_alu);

		in1_tb = 4'b0100; in2_tb = 4'b1001; 
		sel_tb = 3'b000; #10;
		sel_tb = 3'b010; #10;
		sel_tb = 3'b001; #10;
		sel_tb = 3'b100; #10;
		sel_tb = 3'b011; #10;

		$finish;
	end
	endmodule
