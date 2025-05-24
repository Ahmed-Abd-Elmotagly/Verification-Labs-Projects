/*
	Write a SV code to print the contents of 
	a two dimensional array using foreach loop */

module array2d ();
  parameter d1=3,d2=4;
  int array[d1][d2];
  initial begin
     //array ='{{0,1,2,3},{4,5,6,7},{8,9,10,11}};
   int k=0;
  foreach (array[i]) begin
    foreach (array[i][j]) begin
      array[i][j] = k;
      k++;
    end
  end
  foreach (array[i]) begin
    foreach (array[i][j])
      $display("array elements[%0d][%0d] = %0p",i,j, array[i][j]);
    end
  end
endmodule
