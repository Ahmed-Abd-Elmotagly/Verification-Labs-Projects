module mm_counter (
	intf.d dint,
	input bit dclk,
	output logic [3:0] W_count,L_count);
	
	always@(posedge dclk or negedge dint.arstn) begin
		if (!dint.arstn) begin
			dint.count <= 4'b0111; //7
			W_count <= 4'b0000;
			L_count <= 4'b0000;
		end
		
		else begin
			if (dint.INIT) begin 
			dint.count <= dint.inval;
			end
		
			else begin
				case (dint.ctrl)
				
				2'b00: dint.count <= dint.count + 1'b1;
				2'b01: dint.count <= dint.count + 2'b10;
				2'b10: dint.count <= dint.count - 1'b1;
				2'b11:// begin 
					//if (dint.count==1) begin
					//dint.count <= dint.count - 1'b1;
					//end
					/*else*/ dint.count <= dint.count - 2'b10;
					//end
				default: dint.count <= dint.count;
				endcase
			end
			
			case (dint.count)
			4'b0000: L_count <= L_count + 1'b1;
			4'b1111: W_count <= W_count + 1'b1;
			default: begin
			L_count <= L_count;
			W_count <= W_count;
			end
			endcase
		end
	end
	
endmodule