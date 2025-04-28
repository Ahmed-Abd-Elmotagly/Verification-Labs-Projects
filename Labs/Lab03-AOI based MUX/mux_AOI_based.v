module mux_AOI (
  input wire sel,A,B,
  output wire F);
  
  wire selB,FB;
  assign selB = ~sel;
    
  AOI mux1 (.A(selB),.B(A),.C(sel),.D(B),.F(FB));
  assign F = ~FB;
endmodule
