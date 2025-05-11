/* 
	bus arbiter tb 
	without interface construct
	
	verification plan:
	1- reset 
	2- priority module request and corresponding grant
*/

interface arb_if (input bit clk);
	logic [1:0] request;
	logic rst_lo;
	logic [1:0] grant;	
endinterface

module arbiter_tb (
	arb_if tbif
	);
	
	initial begin 
	#1 tbif.rst_lo <= 1'b0;
	assert (tbif.grant == 2'b00) 
		else $error("@%t wrong grant for reset",$time);
	@(posedge tbif.clk) tbif.rst_lo <= 1'b1;
	@(posedge tbif.clk) tbif.request <= 2'b11;
	assert (tbif.grant == 2'b10) 
		else $error("@%t wrong grant for 2'b11",$time);
	repeat (2) @(posedge tbif.clk);
	tbif.request <= 2'b10;
	assert (tbif.grant == 2'b10) 
		else $error("@%t wrong grant for 2'b10",$time);
	#3 tbif.rst_lo <= 1'b0;
	#1 tbif.rst_lo <= 1'b1;
	@(posedge tbif.clk) tbif.request <= 2'b01;
	assert (tbif.grant == 2'b01) 
		else $error("@%t wrong grant for 2'b01",$time);
	$display ("----end of tests----");
	$display ("----end of tests----");
	$dumpfile("wave.vcd");
	$dumpvars;

	#10 $finish	;	
	end
	
endmodule
