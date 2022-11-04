module controle (
	input halt,
	input reset,
	input clock,
	input[3:0] msb_ireg,
	
	output reg hlt,
	output reg pc_inc,
	output reg pc_out,
	output reg jump,
	output reg acc_in,
	output reg acc_out,
	output reg alu_out,
	output reg add_sub,
	output reg alu_1,
	output reg alu_0,
	output reg xor_not,
	output reg mar_in,
	output reg ram_in,
	output reg ram_out,
	output reg br_in,
	output reg ir_in,
	output reg ir_out,
	output reg opr_in
	);
		
	reg[3:0] step = 3'b0;
	reg[7:0] instrucao = 7'b0;
	always @ (posedge clock) begin
	
		if(reset) step = 000;
		
		if(!halt) begin
			assign instrucao = {msb_ireg, step};
		
			hlt <= 0; pc_inc <= 0; pc_out <= 0; jump <= 0; acc_in <= 0; acc_out <= 0; alu_out <= 0; add_sub <= 0; alu_0 <= 0; alu_1 <= 0;
			xor_not <= 0; mar_in <= 0; ram_in <= 0; ram_out <= 0; br_in <= 0; ir_in <= 0; ir_out <= 0; opr_in <= 0;
			
			if(instrucao == 0000000) 	begin pc_out <= 1; mar_in <= 1; end;
			if(instrucao == 0000001) 	begin pc_inc <= 1; ram_out <= 1; ir_in <= 1; end;
			if(instrucao == 0001010)	begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 0001011)   begin ram_out <= 1; acc_in <= 1; end;
			if(instrucao == 0010010)   begin ir_out <= 1; acc_in <= 1; end;
			if(instrucao == 0011010)   begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 0011011)   begin ram_in <= 1; acc_out <= 1; end;
			if(instrucao == 0100010)   begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 0100011)   begin ram_out <= 1; br_in <= 1; end;
			if(instrucao == 0100100)   begin acc_in <= 1; alu_out <= 1; end;
			if(instrucao == 0101010)   begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 0101011)   begin ram_out <= 1; br_in <= 1; end;
			if(instrucao == 0101100)   begin acc_in <= 1; add_sub <= 1; alu_out <= 1; end;
			if(instrucao == 0110010)	begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 0110011)   begin ram_out <= 1; br_in <= 1;	 end;
			if(instrucao == 0110100)   begin acc_in <= 1; alu_0 <= 1; alu_out <= 1;  end;
			if(instrucao == 0111010)   begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 0111011)   begin ram_out <= 1; br_in <= 1; end;
			if(instrucao == 0111100)   begin acc_in <= 1; alu_1 <= 1; alu_out <= 1; end;
			if(instrucao == 1000010)   begin mar_in <= 1; ir_out <= 1; end;
			if(instrucao == 1000011)   begin ram_out <= 1; br_in <= 1; end;
			if(instrucao == 1000100)   begin acc_in <= 1; alu_1 <= 1; alu_0 <= 1; alu_out <= 1; end; 
			if(instrucao == 1001010)   begin acc_in <= 1; alu_1 <= 1; alu_0 <= 1; xor_not <= 1; end;
			if(instrucao == 1010010)   begin jump <= 1; ir_out <= 1; end;
			if(instrucao == 1110010)   begin acc_out <= 1; opr_in <= 1; end;
			if(instrucao == 1111010)   begin hlt <= 1; end;
			
			step = step + 1;
		end
	end

endmodule 
	
	
	
	
	
	
	
	