`timescale 1ns/1ps

module tb_pc;

reg [3:0] in_tb;
reg clk_tb;
reg enb_tb;
reg rst_tb;
wire [3:0] out_tb;

pc UUT (
	.pc_in (in_tb),
	.pc_clk (clk_tb),
	.pc_enb (enb_tb),
	.pc_rst (rst_tb),
	.pc_out (out_tb)
	);

	initial begin
		clk_tb = 1'b0;
		forever #5 clk_tb = ~clk_tb;
	end

	initial begin
		$dumpfile("pc.vcd");
		$dumpvars(0, tb_pc);

		$display("Time\tClk\tReset\tEnable\tAdress\tOutput");
		$display("---------------------------------------------------");
        
        // Initial phase
		in_tb = 4'hF; enb_tb = 1'b0; rst_tb = 1'b1;

        // Enable reset (active-low)
        #1;
        rst_tb = 1'b0; // (Enable asynchronous reset)
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #10;
        rst_tb = 1'b1; // (Disable reset)
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        

        // Scenario 1: Normal incrementing
        #4; //Clock edge 1
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #10; //Clock edge 2
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #10; //Clock edge 3
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #10; //Clock edge 4
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        
        // Scenario 2: Synchronous Load (Jump/Branch)
        #1;
        in_tb = 4'b1100; // Load new adress
        enb_tb = 1'b1; // Enable writing
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #9; // Clock edge 
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #10; // Next clock edge 
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        
        // Scenario 3: Increment after load
        #1;
        in_tb = 4'hF; // New adress
        enb_tb = 1'b0; // Disable writing
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #9; // Clock edge 
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #10; // Next clock edge 
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);

        // Scenario 4: Reset during Incrementation
        #1;
        rst_tb = 1'b0; // Activating Reset
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);
        #9; // Clock edge 
        $display("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk_tb, rst_tb, enb_tb, in_tb, out_tb);

        $display("Simulation finished");
        $finish;
end
endmodule
        
        


