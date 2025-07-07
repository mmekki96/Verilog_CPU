module ir (
	input ir_clk,
	input ir_enb,
	input [7:0] ir_inst,
	output [3:0] ir_opcode,
	output [3:0] ir_operand
	);

	reg [7:0] store;

	always @(posedge ir_clk) begin
		if (ir_enb) begin 
			store <= ir_inst; end
	end

	assign ir_opcode = store[7:4];
	assign ir_operand = store[3:0];
	
	endmodule
