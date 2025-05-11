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
		input logic [1:0] request,
		input logic clk,rst_lo,
		output logic [1:0] grant
	);
	
	always@((posedge(clk)) or (negedge(rst_lo))) begin
		if(!rst_lo) begin
		grant <= 2'b00;
		end
		else begin
			if ((request == 2'b10) || (request == 2'b11)) 
			grant <= 2'b10;
			else if (request == 2'b01)
			grant <= 2'b01;
			else grant <= 2'b00; 
		end
	end
	
endmodule
