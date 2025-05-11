/*
	top module connecting arbiter design and tb
*/
module top (
	 	);
		bit clk;
	arb_if topif(clk);	
	arbiter dut (topif);
	arbiter_tb tb (topif);
	
	always #5 clk =~clk;
	
		
endmodule
	