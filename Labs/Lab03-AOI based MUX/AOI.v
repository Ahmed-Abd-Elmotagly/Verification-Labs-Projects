module andnor (
  input wire A,B,C,D,
  output wire F);
  
  assign F = ~((A&B)|(C&D));
  
endmodule