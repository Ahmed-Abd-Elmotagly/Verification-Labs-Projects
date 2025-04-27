// Code your testbench here
// or browse Examples
module DFF_tb (
	input  tb_q,tb_q_bar,
  	output reg tb_d,tb_clk,tb_rst_l 
	);
  parameter cycle = 5;
  DFF DFF1(
    .q(tb_q),
    .q_bar(tb_q_bar),
    .d(tb_d),
    .clk(tb_clk),
    .rst_l(tb_rst_l));
  
  initial begin
    tb_clk=1'b0;
	@(posedge tb_clk) tb_rst_l=1'b0; // check reset
	#cycle tb_rst_l=1'b1;
    #1 tb_d=1'b1;
    #cycle tb_d=1'b0; // o/p supposed to change
	#(2*cycle) tb_d=1'b1;
	#1 tb_d=1'b0;
    #2 tb_d=1'b1;
  end
  
  always begin
    #cycle tb_clk = ~tb_clk;
     // T=10
  end
  
 initial begin
   $dumpfile ("wave.vcd");
   $dumpvars;
   #200 $finish;
 end
endmodule