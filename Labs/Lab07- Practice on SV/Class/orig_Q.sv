/*
	The original code does the following:
	- define class named widget 
	- has two variables id,to_remove
	- define a queue of widgets named q
	- instantiate an instance of widget named w
	- define integer variable that takes unsigned constrained random values
	- adds places and id values and random to_remove values in the w class 
	- then push these values in the queue
	- print the contents as id and to_remove
	
	The required modifications:
	- Write SV code to remove entries from q that have “to_remove = 1”
	- Write SV code to check that no entry in q has “to_remove = 1”
	
*/

class widget;
  int id;
  bit to_remove;
endclass

module top;
  widget q[$]; // define a queue of "widget"s named q 
  initial begin
    widget w;
    int num = $urandom_range(20,40);
    for (int i=0; i<num; i++) begin
      w = new;
      w.id = i;
      w.to_remove = $urandom_range(0,1);
      q.push_back(w);
      $display("widget id: %2d, to_remove: %b", q[$].id, q[$].to_remove);
    //  $display(q[i].to_remove);
     // if ((q[i].to_remove) == 1'b1) begin $display("catched"); end
    end
 
    for (int j=0; j<num ; j++) begin: loop
    // $display("j1=%0d",j);
      if (q[j].to_remove == 1'b1) begin: cond
       q.delete(j);
       j--;
     //  $display("j=%0d",j);
     end:cond
      
    end:loop
    for (int j=0; j<(q.size) ; j++) begin
      $display("after remove: widget id: %2d, to_remove:%b", q[j].id,q[j].to_remove);
    end
   // check no entries has to_remove = 1
    for (int j=0; j<(q.size) ; j++) begin
    if ((q[j].to_remove) == 1'b1) begin $display("catched error"); end
    else begin 
    if (j==((q.size)-1)) $display("no entries has to_remove = 1");
    end
    end
  end
endmodule
