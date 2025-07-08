module rom (
	input [3:0] rom_addr,
	output reg [7:0] rom_out
	);

	reg [7:0] rom_prog [15:0];

	initial begin 
		rom_prog[0] = 8'h12;
		rom_prog[1] = 8'h25;
        rom_prog[2] = 8'hFC;
		rom_prog[3] = 8'h3A;
		rom_prog[4] = 8'h4F;
		rom_prog[5] = 8'h51;
		rom_prog[6] = 8'h73;
		rom_prog[7] = 8'hAD;
		rom_prog[8] = 8'h00;	
		rom_prog[9] = 8'h00;
		rom_prog[10] = 8'h00;
		rom_prog[11] = 8'h00;
		rom_prog[12] = 8'h00;
		rom_prog[13] = 8'h00;
		rom_prog[14] = 8'h00;
		rom_prog[15] = 8'h00;
	end
    always @(*) begin
        rom_out = rom_prog[rom_addr];
    end
	endmodule
		





