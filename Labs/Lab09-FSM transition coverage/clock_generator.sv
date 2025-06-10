import states_pkg::*;
module clock_gen (output bit clk);
	parameter T=10;
	initial begin
	while(running==1)
	#(T/2) clk = ~clk;
	end
endmodule
