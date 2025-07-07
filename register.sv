module register(
	input [3:0] r_in,
	input r_clk,
	input r_enb,
	output reg [3:0] r_out
	);
	
	reg [3:0] r_str;

	always @(posedge r_clk) begin
		if (r_enb) begin
			r_str <= r_in; end
		
		r_out <= r_str;
		end
		endmodule




