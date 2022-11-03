module acc_reg (
	input clock,
	input reset, 
	input acc_in,
	input acc_out,
	output reg[7:0] d,
	output reg[7:0] q,
	input[7:0] bus_in,
	output reg[7:0] bus_out);
	
	
	always @(posedge clock) begin
		if(reset) 
			q <= 0;
		else begin
			if(acc_in) begin 
				d <= bus_in;
				q <= d; end
			
			if(acc_out) bus_out <= q;
		end
	end
		
endmodule
