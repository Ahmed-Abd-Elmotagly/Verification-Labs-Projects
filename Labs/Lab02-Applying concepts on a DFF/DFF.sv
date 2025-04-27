// Code your design here
module DFF (
	input wire d,clk,rst_l,
	output reg q,q_bar
);
  
  always @(posedge clk) begin
    if (rst_l) begin
      q <= d;  
      q_bar <= ~d;
    end
    else begin
      q <= 1'b0;
      q_bar <= 1'b1;
    end
  end
  
endmodule