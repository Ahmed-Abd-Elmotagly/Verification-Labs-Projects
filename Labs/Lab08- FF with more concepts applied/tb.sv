program dff_tb (intf.tb tb1);
	
	initial begin
	$monitor("@time=%0t , output =%0b",$time,tb1.cb.q);
	$monitor("@time=%0t , reset =%0b",$time,tb1.cb.rst);
	
	
	tb1.cb.rst <= 1'b1;
	tb1.cb.d <= 1'b1;
	repeat (2) @(tb1.cb);
	#2 tb1.cb.rst <= 1'b0;
	tb1.cb.d <= 1'b0;
	#10 tb1.cb.d <= 1'b1;
	/*tb1.cb.d <= 1'b1;
	#3 tb1.cb.d <= 1'b0;
	*/end

endprogram
