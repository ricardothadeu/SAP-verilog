module ram_mar (
	input mar_in,
	input clock,
	input reset,
	input ram_in,
	input ram_out,
	output reg[3:0] mar_addr,
	inout[7:0] bus,
	output reg[7:0] output_bus);
	
	reg [7:0]mem[15:0]; //memoria 16x8
	
	//MAR
	always @(posedge clock) begin
		if(reset) mar_addr <= 4'b0;
		else begin
			if(mar_in)
				mar_addr <= bus[3:0];
		end
	end
	
	//RAM
	always @(posedge clock) begin
		if(ram_in) mem[mar_addr] <= bus; //escrita
		if(ram_out) output_bus <= mem[mar_addr]; else output_bus <= 8'bz;//leitura
	end
	
	assign bus = output_bus;
	
endmodule
	
		
	
	