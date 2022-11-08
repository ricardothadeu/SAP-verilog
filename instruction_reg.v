module instruction_reg(
	input clock,
	input reset,
	input ir_in,
	input ir_out,
	inout[7:0] bus,
	output reg[7:0] q,
	output wire[3:0] out_control, //saida que entrega para o CONTROL
	output reg[7:0] bus_out);
	
	always @(posedge clock) begin
		if(reset)
			q <= 0;
		else begin
			if(ir_in)
				q <= bus;
			if(ir_out) begin
				bus_out[7:4] <= 0;
				bus_out[3:0] <= q[3:0]; //entrega para o barramento os 4 LSB
			end else bus_out <= 8'bz;
		end
	end
	
	assign out_control = q[7:4]; //entrega para o controle os 4 MSB
	
	
endmodule 