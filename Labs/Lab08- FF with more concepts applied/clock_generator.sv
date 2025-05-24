module clock_gen (output bit clk);

always begin
#5 clk = ~clk;
end

endmodule
