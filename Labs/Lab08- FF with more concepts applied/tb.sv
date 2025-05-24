program dff_tb (intf.tb tb1);
	
	initial begin
	$monitor("output =%0b",tb1.q);
	
	tb1.rst = 1'b1;
	tb1.d = 1'b1;
	#8 tb1.rst = 1'b0;
	#10 tb1.d = 1'b0;
	#2 tb1.d = 1'b1;
	#3 tb1.d = 1'b0;
	end

endprogram
