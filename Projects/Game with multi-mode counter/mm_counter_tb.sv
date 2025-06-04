//checks reset,load,WINNER,LOSER
program arst_load_tb (intf.tb t1);
	
	/*
	check winner and loser 
	are not asserted @ same time
	*/
	property winlose; 
	@(t1.cb) disable iff (!t1.arstn) !(t1.cb.WINNER && t1.cb.LOSER);	
	endproperty
	
	initial begin
	//checking reset
	t1.arstn <= 1'b1;
	t1.cb.ctrl <= 2'b00; // up 1
	t1.cb.INIT <= 1'b0;
	t1.cb.inval <= 4'b0000;
	#1 t1.arstn <= 1'b0;
	repeat(2) @(t1.cb);
	t1.arstn <= 1'b1; // reset turned off
	repeat(2) @(t1.cb);
	/* checking features:
		- load
		- WINNER
		- LOSER
	*/
	t1.cb.INIT <= 1'b1; // load mode and check loser
	repeat(2) @(t1.cb); 
	#1 t1.arstn <= 1'b0;
	@(t1.cb) t1.arstn <= 1'b1;
	t1.cb.inval <= 4'b1111; //check winner 
	@(t1.cb)t1.cb.INIT <= 1'b0;
	
	$monitor("@time= %0t LOSER =%0b WINNER =%0b GAMEOVER =%0b WHO =%0b Count =%0d "
	,$time,t1.cb.LOSER,t1.cb.WINNER,t1.cb.GAMEOVER,t1.cb.WHO,t1.cb.count);
	                         
	end
	
	assert property (winlose)
	else $warning("illegal WINNER and LOSER");
	
		
endprogram
