module output_reg (
	input clock,
	input reset,
	input opr_in,
	input[7:0] bus,
	output reg[7:0] out_bus);
	
	
	always @(posedge clock) begin
		if(reset)
			out_bus <= 0;
		else begin
			if(opr_in)
				out_bus <= bus;
		end
	end

endmodule 