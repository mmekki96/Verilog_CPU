`timescale 1ns/1ps

module tb_register;

reg [3:0] in_tb;
reg clk_tb;
reg enb_tb;
wire [3:0] out_tb;

register UUT (
	.r_in (in_tb),
	.r_clk (clk_tb),
	.r_enb (enb_tb),
	.r_out (out_tb)
	);

	initial begin
		clk_tb = 1'b0;
		forever #5 clk_tb = ~clk_tb;
	end

	initial begin 
		$dumpfile("register.vcd");
		$dumpvars(0, tb_register);
		$display("Time\tclk\tinput\tenable\toutput");
		$display("------------------------------------------------");
        
        //Initial State (t=0)
		in_tb = 4'b0000; enb_tb = 1'b0; #1;
		$display("%0t\t%b\t%b\t%b\t%b", $time, clk_tb, in_tb, enb_tb, out_tb);
        // Scenario 1: First Load (load 1010)
		#9;
		in_tb = 4'b1010; // Data to load
        	enb_tb = 1'b1; // Enable write
        	#10;
		$display("%0t\t%b\t%b\t%b\t%b", $time, clk_tb, in_tb, enb_tb, out_tb);
		
        // Scenairo 2: Hold Value
        	#10;
		in_tb = 4'b0110; // Change input data
        	enb_tb = 1'b0; // Disable write
        	#10;
		$display("%0t\t%b\t%b\t%b\t%b", $time, clk_tb, in_tb, enb_tb, out_tb);

        // Scenario 3: Load again (load 0011)
        	#10;		
		in_tb = 4'b0011; // New data to load
		enb_tb = 1'b1; // Enable write
        	#10;
        	$display("%0t\t%b\t%b\t%b\t%b", $time, clk_tb, in_tb, enb_tb, out_tb);

        // Scenario 4: Change input while write disabled
        	#10;		
		enb_tb = 1'b0; // Disable write
        	in_tb = 4'b1111; // Change input
        	#5;
        	in_tb = 4'b0000; // Change input again
        	#5;
        	$display("%0t\t%b\t%b\t%b\t%b", $time, clk_tb, in_tb, enb_tb, out_tb);

        	$display("------------------------------------------------");
		$display("Simulation finished");
		$finish;
	end
	endmodule
		

