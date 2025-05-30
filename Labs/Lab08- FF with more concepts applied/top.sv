module top (output clk);
logic w1;
assign clk = w1;
clock_gen clk1 (w1);
intf itop (w1);
dff_tb t1 (itop.tb);
d_ff d1 (itop.dff,w1);
	 initial begin
	   $dumpfile ("wave.vcd");
	   $dumpvars;
	end
endmodule
