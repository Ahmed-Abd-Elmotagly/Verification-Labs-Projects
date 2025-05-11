/*
	Bus arbiter design
	considering 2 modules connected 
	module a has higher priority
	each module places a request and the arbiter gives the grant signal
		   a  b grant
		   1  0  10
		   1  1	 10
		   0  1  01
		   0  0  00 the reset value
*/

module arbiter (
		arb_if dif
	);
	
	always@(posedge dif.clk or negedge dif.rst_lo) begin
		if(!dif.rst_lo) begin
		dif.grant <= 2'b00;
		end
		else begin
			if (dif.request == 2'b10 || dif.request == 2'b11) 
			dif.grant <= 2'b10;
			else if (dif.request == 2'b01)
			dif.grant <= 2'b01;
			else dif.grant <= 2'b00; 
		end
	end
	
endmodule
