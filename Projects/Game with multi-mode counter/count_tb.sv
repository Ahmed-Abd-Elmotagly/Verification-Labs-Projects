//checks counting modes
program count_tb (intf.tb t1);
	
	initial begin
	t1.arstn <= 1'b0; // reset
	@(t1.cb);
	t1.arstn <= 1'b1; // disable reset
	t1.cb.INIT <= 1'b0; 
	t1.cb.inval <= 4'b0000;
	t1.cb.ctrl <= 2'b00; // up 1
	repeat (4) @(t1.cb); // check counting up by 1
	@(t1.cb) begin
	assert (t1.cb.count==4'hb) 
	$display ("correct counting up by 1");
	else $error ("wrong count up by 1, count =%0d ",t1.cb.count);
	end
	@(t1.cb);
	t1.arstn <= 1'b0; // reset
	@(t1.cb);
	t1.arstn <= 1'b1; // disable reset
	t1.cb.ctrl <= 2'b01; // up 2
	repeat (4) @(t1.cb); // check counting up by 2
	@(t1.cb) begin
	assert (t1.cb.count==4'hf) 
	$display ("correct counting up by 2");
	else $error ("wrong count up by 2, count =%0d ",t1.cb.count);
	end
	t1.arstn <= 1'b0; // reset
	@(t1.cb);
	t1.arstn <= 1'b1; // disable reset
	t1.cb.ctrl <= 2'b10; // down 1
	repeat (4) @(t1.cb); // check counting down by 1
	@(t1.cb) begin
	assert (t1.cb.count==4'h3) 
	$display ("correct counting down by 1");
	else $error ("wrong count =%0d ",t1.cb.count);
	end
	t1.arstn <= 1'b0; // reset
	@(t1.cb);
	t1.arstn <= 1'b1; // disable reset
	t1.cb.ctrl <= 2'b11; // down 2
	repeat (4) @(t1.cb); // check counting down by 2
	@(t1.cb) begin
	assert (t1.cb.count==4'hf) 
	$display ("correct counting down by 2");
	else $error ("wrong count =%0d ",t1.cb.count);
	end
	$monitor("@time= %0t LOSER =%0b WINNER =%0b GAMEOVER =%0b WHO =%0b Count =%0d "
	,$time,t1.cb.LOSER,t1.cb.WINNER,t1.cb.GAMEOVER,t1.cb.WHO,t1.cb.count);
	                         
	end
	
endprogram
