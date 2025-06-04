/*
		bism-allah
	multi-mode counter
	specs:
	count up and down by ones and by twos
	
	Control Value 		Function 
	00 					Count up by 1’s
	01 					Count up by 2’s 
	10 					Count down by 1’s 
	11 					Count down by 2’s
	
	Have an initial value input 
	and a control signal called INIT

	When INIT is logic 1,
	parallelly load that initial value into the multi-mode counter
	
	Whenever count is equal to all zeros, set a signal called LOSER high. 
	When the count is all ones, set a signal called WINNER high.

	In either case, the set signal should remain high for only one cycle.
	
	With a pair of plain binary counters, 
	count the number of times WINNER and LOSER goes high. 
	
	When one of them reaches 15, set an output called GAMEOVER high. 
	
	If the game is over because LOSER got to 15 first, 
	set a two-bit output called WHO to 2’b01. 
	
	If the game is over because WINNER got to 15 first, 
	set WHO to 2’b10. 
	
	WHO should start at 2’b00 and return to it after each game over.
 
	Then synchronously clear all the counters and start over. The game never ends.

	some corner cases that needed assumptions in the design:
	- the reset value of count needs to be middle value
	  because the all zeros means loser and
	  all ones means winner 
	   assume the game starts at 7 after reset
	   otherwise the initial value can be used

*/

module top (output clk);
	
	logic w1;
	logic [3:0] count,W_count,L_count;
	assign clk = w1;
	clock_gen clk1 (w1);
	intf itop (w1);
//	arst_load_tb tb1 (itop.tb);
//	count_tb tb2 (itop.tb);
	end_tb tb3 (itop.tb);
	mm_counter dut_c (itop.d,w1,W_count,L_count);
	flags_ctrl dut_f (w1,W_count,L_count,itop.fctr);
	
	initial begin
	   $dumpfile ("wave.vcd");
	   $dumpvars;
	end
	
endmodule