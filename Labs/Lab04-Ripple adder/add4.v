module add4 (
  input wire [3:0] in1,in2,
  input wire cin,
  output reg [3:0] sum,
  output reg cout);

always@(*) begin
  {cout,sum} = in1 + in2 + cin;
end

endmodule