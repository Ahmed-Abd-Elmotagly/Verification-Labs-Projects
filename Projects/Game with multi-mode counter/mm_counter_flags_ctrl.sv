module flags_ctrl (
	input bit dclk,
	input logic [3:0] W_count,L_count,
	intf.fctr f1);

	always@(posedge dclk or negedge f1.arstn) begin
		if (!f1.arstn) begin
				f1.WHO <= 2'b00;
				f1.GAMEOVER <= 1'b0;
				f1.WINNER <= 1'b0;
				f1.LOSER <= 1'b0;
		end
		else begin
			case (f1.count)
			4'b0000: begin 
			f1.LOSER <= 1'b1; 
			f1.WINNER <= 1'b0;			
			end
			4'b1111: begin 
			f1.WINNER <= 1'b1; 
			f1.LOSER <= 1'b0;
			end
			default: begin
			f1.WINNER <= 1'b0;
			f1.LOSER <= 1'b0;
			end
			endcase
			
			case (W_count)
			4'b1111: begin
			f1.GAMEOVER <= 1'b1;
			f1.WHO <= 2'b10;			
			end
			default: begin
			f1.GAMEOVER = 1'b0;
			f1.WHO = 2'b00;
			end
			endcase
			
			case (L_count)
			4'b1111: begin
			f1.GAMEOVER <= 1'b1;
			f1.WHO <= 2'b01;			
			end
			default: begin
			f1.GAMEOVER = 1'b0;
			f1.WHO = 2'b00;
			end
			endcase
			
		end
		
	
	end
	
endmodule