module p_counter (
	input pc_inc,
	input clock,
	input reset,
	input pc_out,
	input jump,
	output reg[3:0] q,
	inout [3:0] bus,
	output reg[3:0] output_bus);
	
	//assign bus = 4'bz;
	initial begin
		q = 4'b0000; 
	end
	
	always @(posedge clock) begin
			if(reset) q <= 4'b0;
			else begin
				output_bus <= pc_out ? q : 4'bz;
				q <= jump ? bus : q;
				if(pc_inc) q <= q + 4'b0001;

			end
	end
	
	assign bus = output_bus;
	
endmodule 