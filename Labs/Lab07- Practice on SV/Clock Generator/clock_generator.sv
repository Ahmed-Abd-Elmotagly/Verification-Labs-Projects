//Write a clock generator without using an always block
`timescale 1ns/1ns
module clk(
  output bit clk);
parameter T=10;

initial begin
  forever 
  #(T/2) clk=~clk;
  end
  

endmodule