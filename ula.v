module ula(
	input[7:0] a,
	input[7:0] b,
	input alu1, alu0,
	inout[7:0] bus,
	output reg[7:0] output_bus,
	
	input add_sub,
	input xor_not,
	input alu_out);
		
always @ (alu1 or alu0 or add_sub or xor_not) begin
		
		if(alu_out) begin
			case({alu1, alu0})
				2'b00 : begin
					if(add_sub == 0) 
						output_bus <= a + b;
					else
						output_bus <= a - b; end
				
				2'b01 : output_bus <= a & b;
				
				2'b10 : output_bus <= a | b;
				
				2'b11 : begin
					if(xor_not) 
						output_bus <= ~a; //se xor_not = 1, faz o not de acc
					else
						output_bus <= a ^ b; //caso contrario, faz a operaçao XOR
					end
			endcase
		end else output_bus <= 8'bz;
	end
	
	assign bus = output_bus;

endmodule
			
			
			
			