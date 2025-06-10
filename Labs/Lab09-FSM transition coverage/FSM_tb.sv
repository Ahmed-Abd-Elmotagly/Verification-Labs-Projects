import states_pkg::*;
module fsm_tb (intf.tb itb);

class transaction;
rand bit in;
endclass

covergroup fsmcov;

	cp1: coverpoint itb.cb_tb.state {
	
	bins t1 = (IDLE => IDLE);
	bins t2 = (IDLE => INIT);
	bins t3 = (INIT => IDLE);
	bins t4 = (DECODE => IDLE);
	bins t5 = (DECODE => DECODE);
	bins t6 = (INIT => DECODE);
	}

endgroup


initial begin

transaction tr;
fsmcov test1;
tr = new ();
test1 = new ();
itb.rst = 1;
#22 itb.rst = 0;
$display ("-------------------");

repeat (50) begin
assert (tr.randomize());
itb.pin <= tr.in;
test1.sample();
@itb.cb_tb;
end
running = 0;
end
endmodule
