module acc_reg (
	input clock,
	input reset, 
	input acc_in,
	input acc_out,
	output reg[7:0] q,
	inout[7:0] bus,
	output wire[7:0] acc_ula, //saida que entrega pra ula 
	output reg[7:0] output_bus);
	
	always @(posedge clock) begin
		if(reset) 
			q <= 0;
		else begin
			if(acc_in)
				q <= bus;
			
			if(acc_out) 
				output_bus <= q;
			else output_bus <= 8'bz;
		end
	end
	
	assign acc_ula = q;
	assign bus = output_bus;
		
endmodule
