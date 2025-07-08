`timescale 1ns/1ps

module tb_rom;

reg [3:0] addr_tb;
wire [7:0] out_tb;

rom UUT (
	.rom_addr (addr_tb),
	.rom_out (out_tb)
	);

	initial begin
		$dumpfile("rom.vcd");
		$dumpvars(0, tb_rom);
		$display("Time\tAdress\tOutput");
		$display("------------------------------------------");

        	// Initial Phase
        	addr_tb = 4'bxxxx; // No location set
            #1;
        	$display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#4;

        	// Set address location (PC) to 0x0
	        addr_tb = 4'b0000; // PC point to 0x0
            #1; // Time to compute another output  	
            $display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#9;

	        // Set address location (PC) to 0x1
        	addr_tb = 4'b0001; // PC pont to 0x1
            #1; // Time to compute another output
        	$display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#9;

	        // Set address location to 0x2
        	addr_tb = 4'b0010;
            #1;
        	$display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#9;

	        // Set address location to 0x3
        	addr_tb = 4'b0011;
            #1;
        	$display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#9;

	        // Set address location to 0x7
	        addr_tb = 4'b0111;
            #1;
        	$display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#9;

        	// Set address location to 0xA
        	addr_tb = 4'b1010;
            #1;
        	$display("%0t\t%b\t%b", $time, addr_tb, out_tb);
        	#9;

		$display("Simulation finished");
		$finish;
        	end

	endmodule

