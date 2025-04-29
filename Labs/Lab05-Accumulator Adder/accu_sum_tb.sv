module accu_sum_tb ();
	parameter T = 4;
	reg reset_tb,clk_tb;
	reg [31:0] amt_tb; 
	wire [31:0] sum_tb;
	
	accu dut_sum (
				.reset(reset_tb),
				.clk(clk_tb),
				.amt(amt_tb),
				.sum(sum_tb)
	);
	
	/*
	check accumulation sum is working properly
	start with reset (initialization)
	 
	*/
	initial begin
	clk_tb = 1'b0; 
	reset_tb = 1'b1;
	#1 reset_tb = 1'b0;
	 amt_tb =32'd0;
	@(posedge clk_tb) amt_tb =32'd2;
	@(negedge clk_tb) 
		assert (sum_tb==32'd2) 
			else $error ("accu sum failed");
	@(posedge clk_tb) amt_tb =32'd4;
	@(negedge clk_tb) 
		assert (sum_tb==32'd6) 
			else $error ("accu sum failed");
	$dumpfile("sum_tb_wave.vcd");
	$dumpvars;
	#200 $finish;
	end
	
	
	always begin
	#(T/2) clk_tb=~clk_tb;
	end
	
	
	
endmodule
