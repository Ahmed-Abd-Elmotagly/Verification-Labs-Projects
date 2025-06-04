module clock_gen (output bit clk);
	parameter T=10;
	always begin
	#(T/2) clk = ~clk;
	end	
endmodule