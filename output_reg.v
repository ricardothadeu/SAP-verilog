module output_reg (
	input clock,
	input reset,
	input opr_in,
	inout[7:0] bus,
	output reg[7:0] saida);
	
	
	always @(posedge clock) begin
		if(reset)
			saida <= 0;
		else begin
			if(opr_in)
				saida <= bus;
		end
	end

endmodule 