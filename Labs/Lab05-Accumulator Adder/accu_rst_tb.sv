module accu_rst_tb ();
	parameter T = 4;
	reg reset_tb,clk_tb;
	reg [31:0] amt_tb; 
	wire [31:0] sum_tb;
	
	accu dut_rst (
				.reset(reset_tb),
				.clk(clk_tb),
				.amt(amt_tb),
				.sum(sum_tb)
	);
	
	/*
	we want to check reset is working properly
	start with no reset (no initialization)
	after 1 -ve edge the sum should be random
	reset between clock edges to check asynchronous
	check the sum is zero after reset
	initialize amt 
	*/
	initial begin
	clk_tb = 1'b0; 
	reset_tb = 1'b0;
	#5 reset_tb = 1'b1;
	#1 amt_tb =32'h1111;
		@(posedge clk_tb) begin
		assert (sum_tb == 32'b0) else $error("reset failed");
		end
		@(negedge clk_tb) begin
		assert (sum_tb == 32'b0)
			else $error("reset failed on negative edge");
		end
	#(3*T) reset_tb =1'b0; 
	$dumpfile("rst_tb_wave.vcd");
	$dumpvars;
	#200 $finish;
	end
	
	always begin
	#(T/2) clk_tb=~clk_tb;
	end
	
	
	
endmodule