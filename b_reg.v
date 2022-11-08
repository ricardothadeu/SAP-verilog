module b_reg (
	input clock,
	input reset, 
	input br_in,
	output reg[7:0] q,
	inout[7:0] bus,
	output wire[7:0] b_ula); //saida que entrega pra ula
	
	always @(posedge clock) begin
		if(reset) 
			q <= 0;
		else begin
			if(br_in)
				q <= bus;
		end
	end
	assign b_ula = q;
	
endmodule
