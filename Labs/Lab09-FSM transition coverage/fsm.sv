import states_pkg::*;
module fsm (intf.d ifsm);

fmstate_e pstate;

always@(ifsm.rst) begin
	
	if (ifsm.rst == 1) pstate = IDLE;

end 

always@(ifsm.cb_dut) begin

	case (pstate)
	IDLE: begin
		if (ifsm.pin == 0) begin
		pstate = IDLE;
		ifsm.pout = 1'b0;
		end
		else begin
		pstate = INIT;
		ifsm.pout = 1'b0;
		end
	end
	
	INIT: begin
		if (ifsm.pin == 0) begin
		pstate = IDLE;
		ifsm.pout = 1'b0;
		end
		else begin
		pstate = DECODE;
		ifsm.pout = 1'b1;
		end
	
	end
	
	DECODE: begin
		if (ifsm.pin == 0) begin
		pstate = DECODE;
		ifsm.pout = 1'b1;
		end
		else begin
		pstate = IDLE;
		ifsm.pout = 1'b1;
		end
	end
	endcase
	ifsm.cb_dut.state <= pstate;
end

endmodule