interface intf (input bit clk);
	
	logic [1:0] ctrl;
	logic [3:0] inval,count;
	logic INIT, LOSER, WINNER, GAMEOVER,arstn;
	logic [1:0] WHO	;
	
	
	clocking cb @(posedge clk);
	default input #1step output #1ns ;
	
	input LOSER,WINNER,GAMEOVER,WHO,count;
	output ctrl,inval,INIT;	
	endclocking
	
	
	
	modport d (/*clocking cb,*/
			   input ctrl,inval,INIT,arstn,
			   output count);
			   
	modport tb (clocking cb,/*
				input LOSER,WINNER,GAMEOVER,WHO,count,
				*/output/*ctrl,inval,INIT,*/arstn);
				
	modport fctr(/*clocking cb,*/
				input arstn,count,
				output LOSER,WINNER,GAMEOVER,WHO);
endinterface