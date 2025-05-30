interface intf (input bit clk);
logic d,rst,q;

clocking cb @(posedge clk);
default input #2ns output #2ns ;
input q;
output d,rst;
endclocking

modport tb (clocking cb);
modport dff  (input d,rst, output q);

endinterface