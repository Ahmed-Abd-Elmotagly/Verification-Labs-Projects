import states_pkg::*;
interface intf (input bit clk);

bit rst;
bit pin;
bit pout;
fmstate_e state;

clocking cb_tb @(posedge clk);
input state;
endclocking

clocking cb_dut @(posedge clk);
output state;
endclocking

modport d (input rst,pin,clocking cb_dut,
		   output pout);
		   
modport tb (output rst,pin, clocking cb_tb,
			input pout);

endinterface
