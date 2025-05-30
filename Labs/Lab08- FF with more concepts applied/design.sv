module d_ff (intf.dff d1,
			 input bit clk	);
	always @(posedge clk) begin
		if (d1.rst==1) begin
		d1.q <= 1'b0 ;
		end
		else begin
		d1.q <= d1.d ;
		end
	end
endmodule
