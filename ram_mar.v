module ram_mar (
	input mar_in,
	input clock,
	input reset,
	input ram_in,
	input ram_out,
	output reg[3:0] mar_addr, //vem do MAR. BUS[3:0]
	//input[7:0] write_mem, //vem do BUS 
	input[7:0] bus,
	output reg[7:0] bus_out);
	
	reg [7:0]mem[15:0];

	always @(posedge clock) begin
		if(reset) mar_addr <= 0;
		else begin
			if(mar_in)
				mar_addr <= bus[3:0];
		end
	end
	
	
	always @(posedge clock) begin
		if(ram_in) mem[mar_addr] <= bus; //escrita
		if(ram_out) bus_out <= mem[mar_addr]; //leitura
	end
	
endmodule
	
		
	
	