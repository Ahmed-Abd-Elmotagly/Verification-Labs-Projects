module d_ff (intf.dff d1);
	always @(d1.cb) begin
		if (d1.rst==1) begin
		d1.cb.q <= 1'b0 ;
		end
		else begin
		d1.cb.q <= d1.d ;
		end
	end
endmodule
