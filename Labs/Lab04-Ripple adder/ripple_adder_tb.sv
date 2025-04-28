module r_adder_tb ( );
 reg  [3:0] a_tb,b_tb;
 reg cin_tb;
 wire [3:0] sum_tb;
 wire cout_tb;
  bit [4:0] out_sum;
add_struc adder_dut (a_tb,b_tb,cin_tb,sum_tb,cout_tb);

initial begin 
  a_tb = 4'b1111;
  b_tb = 4'b1101;
  cin_tb = 1'b0;
  #1
  out_sum [4:0] = {cout_tb,sum_tb[3:0]};
  $display("First input = %d",a_tb);
  $display("Second input = %d",b_tb);
  $display("sum = %d",out_sum);
  assert (out_sum == (a_tb+b_tb)) else $error("it's gone wrong");
  
 
  
end
endmodule
