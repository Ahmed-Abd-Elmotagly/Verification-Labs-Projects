module add_struc #(parameter width = 4)(
  input wire [width-1:0] a,b,
  input wire cin,
  output wire  [width-1:0] sum,
  output wire cout);
  
 wire cout0,cout1,cout2;
 
  FA FA_0 (.A(a[0]),.B(b[0]),.Cin(cin),.sum(sum[0]),.Cout(cout0));
  FA FA_1 (.A(a[1]),.B(b[1]),.Cin(cout0),.sum(sum[1]),.Cout(cout1));
  FA FA_2 (.A(a[2]),.B(b[2]),.Cin(cout1),.sum(sum[2]),.Cout(cout2));
  FA FA_3 (.A(a[3]),.B(b[3]),.Cin(cout2),.sum(sum[3]),.Cout(cout));
  
endmodule
