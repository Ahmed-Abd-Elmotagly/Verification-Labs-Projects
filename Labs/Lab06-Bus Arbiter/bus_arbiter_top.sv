/*
	top module connecting arbiter design and tb
*/
module top ();
	
	logic [1:0] request;
	 bit clk;
	 logic rst_lo;
	 logic [1:0] grant;

	arbiter dut (request,clk,rst_lo,grant);
	arbiter_tb tb (request,clk,rst_lo,grant);
	
	always #5 clk =~clk;
	

		
endmodule
	
