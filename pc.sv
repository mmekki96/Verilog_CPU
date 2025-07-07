module pc (
	input [3:0] pc_in,
	input pc_clk,
	input pc_enb,
	input pc_rst,
	output reg [3:0] pc_out
	);

	reg [3:0] store;

	always @(posedge pc_clk or negedge pc_rst) begin
		if (!pc_rst) begin
			store <= 4'b0000; end
		else if (pc_enb) begin
			store <= pc_in; end
		else begin
			store <= store + 4'b0001; end

		pc_out <= store;
		end

		endmodule



