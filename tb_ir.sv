`timescale 1ns/1ps

module tb_ir;

reg clk_tb;
reg enb_tb;
reg [7:0] inst_tb;
wire [3:0] opcode_tb;
wire [3:0] operand_tb;

ir UUT (
	.ir_clk (clk_tb),
	.ir_enb (enb_tb),
	.ir_inst (inst_tb),
	.ir_opcode (opcode_tb),
	.ir_operand (operand_tb)
	);

	initial begin
		clk_tb = 1'b0;
		forever #5 clk_tb = ~clk_tb;
	end

	initial begin
		$dumpfile("ir.vcd");
		$dumpvars(0, tb_ir);

		$display("Time\tClk\tEnable\tInstruction\tOpcode\tOperand");
        $display("--------------------------------------------------------");
		
        // Initial Phase
        inst_tb = 8'hxx; // instruction set to unkown
        enb_tb = 1'b0; // Writing disabled
        #1;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, enb_tb, inst_tb, opcode_tb, operand_tb);
        #4;

        // Scenario 1: Enable writing a new Instruction
        inst_tb = 8'h12; // Instruction for IR to load: Opcode 0001, Operand 0010
 		enb_tb = 1'b1;   // Enable writing in IR
 		#5;
        @(posedge clk_tb);
        #1;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, enb_tb, inst_tb, opcode_tb, operand_tb);
        #9;

        // Scenario 2: Hold the Instruction
        enb_tb = 1'b0; //Disable writing
        inst_tb = 8'h4C; // New instruction
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, enb_tb, inst_tb, opcode_tb, operand_tb);
        #5; // Clock edge
        @(posedge clk_tb);
        #1;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, enb_tb, inst_tb, opcode_tb, operand_tb);
        #9;

        // Scenario 3: Load new Instruction
        enb_tb = 1'b1; //Disable writing
        #5;
        @(posedge clk_tb);
        #1;
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, enb_tb, inst_tb, opcode_tb, operand_tb);
        #20;
        
        $display("Finish simulation");
        $finish;
end
endmodule

















        




        
