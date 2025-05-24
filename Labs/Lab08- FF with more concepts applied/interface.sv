interface intf (input bit clk);
logic d,rst,q;

clocking cb @(posedge clk);
default input #10ns output #2ns ;
output q;
endclocking

modport dff (clocking cb,input d,rst);
modport tb  (output d,rst, input q);

endinterface