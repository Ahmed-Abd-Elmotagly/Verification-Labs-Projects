/* 
checks the features of 
	- GAMEOVER
	- WHO
	- restart
*/
program end_tb (intf.tb t1);
	
	initial begin
	t1.arstn <= 1'b0; // reset
	@(t1.cb);
	t1.arstn <= 1'b1; // disable reset
	t1.cb.INIT <= 1'b1; 
	t1.cb.inval <= 4'b1111;
	t1.cb.ctrl <= 2'b11; 
	repeat (17) @(t1.cb); // keep count = 1111 for 16 cycles and one for the update
	@(t1.cb) begin
	assert (t1.cb.GAMEOVER==1'b1 & t1.cb.WHO==2'b10) 
	$display ("Correct GAMEOVER & WINNER");
	else $error ("Wrong GAMEOVER & WINNER");
	end
	@(t1.cb);
	t1.cb.INIT <= 1'b0; 
	t1.cb.inval <= 4'b0000;
	@(t1.cb);
	t1.cb.INIT <= 1'b1; 
	repeat (17) @(t1.cb); // 
	@(t1.cb) begin
	assert (t1.cb.GAMEOVER==1'b1 & t1.cb.WHO==2'b01 ) 
	$display ("Correct GAMEOVER & LOSER");
	else $error ("Wrong GAMEOVER & LOSER");
	end
	$monitor("@time= %0t LOSER =%0b WINNER =%0b GAMEOVER =%0b WHO =%2b Count =%0d "
	,$time,t1.cb.LOSER,t1.cb.WINNER,t1.cb.GAMEOVER,t1.cb.WHO,t1.cb.count);
	                         
	end
	
endprogram
