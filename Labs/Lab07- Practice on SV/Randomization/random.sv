//print 100 unique random integer between 10 and 1000 in a file using system verilog
module random ();
  int o_file,len;
  int q[$:100],c[$:100];
  initial begin
    for (int i=0; i<=100;i++) begin
    c[i] = $urandom_range(10,1000);
    len = c.size();
    if (len == 100) begin
        q = c.unique();
        len = q.size();
        i=len;
       // $display("done yaba");
      end
  end
    
    q = c.unique();
    $display("%0d",q.size());
    $display("c = %0p",c);
    $display("q = %0p",q);
   /* if (c.size()<100) begin
    for  (int i=0;i<(c.size()-1);i++) */
    o_file =$fopen("output.txt","w");
	$fdisplay(o_file,q);
  
  end
endmodule
