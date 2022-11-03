module ula(
	input[7:0] a,
	input[7:0] b,
	input[1:0] selecao,
	output reg[7:0] bus,
	
	
	input add_sub,
	input not_acc,
	input alu_out);
		
always @ (selecao or add_sub or not_acc) begin
		if(alu_out) begin
			case(selecao)
				2'b00 : begin
					if(add_sub == 0)
						bus <= a + b;
					else
						bus <= a - b; end
				
				2'b01 : bus <= a && b;
				
				2'b10 : bus <= a || b;
				
				2'b11 : begin
					if(not_acc) 
						bus <= ~a;
					else
						bus <= a ^ b; 
					end
			endcase
		end
	end
	

	
endmodule
			
			
			
			