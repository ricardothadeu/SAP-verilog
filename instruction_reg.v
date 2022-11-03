module instruction_reg(
	input clock,
	input reset,
	input ir_in,
	input ir_out,
	input[7:0] bus_in,
	output reg[7:0] q,
	output[3:0] out_control,
	output reg[7:0] bus_out);
	
	always @(posedge clock) begin
		if(reset)
			q <= 0;
		else begin
			if(ir_in)
				q <= bus_in;
			if(ir_out) begin
				bus_out[7:4] <= 0;
				bus_out[3:0] <= q[3:0];
			end
		end
	end
	
	assign out_control = q[7:4];
	
	
endmodule 