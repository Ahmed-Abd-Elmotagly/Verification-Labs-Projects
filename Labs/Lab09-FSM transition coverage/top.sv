module top ();

logic w1;

clock_gen clk1(w1);
intf itop (w1);
fsm d1(itop.d);
fsm_tb t1(itop.tb);
endmodule
