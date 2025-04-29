module accu ( 
  input wire reset,clk,
  input wire [31:0] amt, 
  output reg [31:0] sum);
  
  reg [31:0] reg_in;
  
  always@(posedge reset) begin
   
      sum[31:0] = 32'b0;
      reg_in[31:0]=32'b0;
  end
  always@(posedge clk)  begin
   if(!reset) reg_in [31:0] <= amt[31:0] + reg_in[31:0] ;
  end
  
  always@(negedge clk) begin
   if(!reset) sum [31:0] <= reg_in [31:0];
  end

  
endmodule
