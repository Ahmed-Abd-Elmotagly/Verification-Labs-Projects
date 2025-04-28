module FA_tb (
  output reg a_tb,b_tb,cin_tb,
  input wire sum_tb,cout_tb);
  
  FA FA_dut(.A(a_tb),.B(b_tb),.Cin(cin_tb),.sum(sum_tb),.Cout(cout_tb));
  
  initial begin 
    a_tb=1'b1;
    b_tb=1'b1;
    cin_tb=1'b1;
    #1
    $display("sum = %b",sum_tb);
    $display("carry = %b",cout_tb);
    
  end
  
endmodule
