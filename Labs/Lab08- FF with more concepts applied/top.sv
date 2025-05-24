module top (output clk);
	
	
	logic w1;
	clock_gen clk1(w1);
	intf itop (w1);
	d_ff dut (itop.dff);
	dff_tb tb1 (itop.tb);
	
	assign clk = w1; 
	 initial begin
	   $dumpfile ("wave.vcd");
	   $dumpvars;
	end
endmodule
