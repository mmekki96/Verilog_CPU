module alu (
	input [3:0] in1,
	input [3:0] in2,
	input [2:0] sel,
	output reg [3:0] out
	);

	always @(*) begin
		case(sel)
			3'b000 : out = in1 + in2;
			3'b001 : out = in1 - in2;
			3'b010 : out = in1 & in2;
			3'b011 : out = in1 | in2;
			3'b100 : out = in1 ^ in2;
			3'b101 : out = ~in1;
			default : out = 4'bXXXX;
		endcase
	end
	endmodule
