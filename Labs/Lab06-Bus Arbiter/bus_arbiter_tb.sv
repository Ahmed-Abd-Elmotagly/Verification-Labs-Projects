/* 
	bus arbiter tb 
	without interface construct which makes race conditions more possible
	
	verification plan:
	1- reset 
	2- priority module request and corresponding grant
*/
module arbiter_tb (
	output logic [1:0] request,
	input bit clk,
	output logic rst_lo,
	input logic [1:0] grant	
	);
	
	initial begin 
	#1 rst_lo <= 1'b0;
	assert (grant == 2'b00) 
		else $error("@%t wrong grant for reset",$time);
	@(posedge clk) rst_lo <= 1'b1;
	@(posedge clk) request <= 2'b11;
	assert (grant == 2'b10) 
		else $error("@%t wrong grant for 2'b11",$time);
	repeat (2) @(posedge clk);
	request <= 2'b10;
	assert (grant == 2'b10) 
		else $error("@%t wrong grant for 2'b10",$time);
	#3 rst_lo <= 1'b0;
	#1 rst_lo <= 1'b1;
	@(posedge clk) request <= 2'b01;
	assert (grant == 2'b01) 
		else $error("@%t wrong grant for 2'b01",$time);
	$display ("----end of tests----");
	$dumpfile("wave.vcd");
	$dumpvars;

	#10 $finish	;
	end
	
	

endmodule
