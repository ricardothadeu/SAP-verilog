module p_counter (
	input pc_inc,
	input clock,
	input reset,
	input pc_out,
	input jump,
	output reg[3:0] q,
	input[3:0] bus_in,
	output reg[3:0] bus_out);
	
	initial begin
		q = 4'b0;
	end
		
	always @(posedge clock) begin
		
		if(reset)
			q <= 0;
		else begin
			if(pc_inc)
				q <= q + 1;
			if(jump)
				q <= bus_in;
			if(pc_out)
				bus_out <= q;
		end
	end
				
endmodule 