class transaction;
  
  rand bit d;
  bit q;
  
  constraint d_dist_c {
    d dist { 1 := 8,0 := 2 }; }
  
  function void display(string name);
    $display("%0t %s: d = %0b, q = %0b",$time, name, d, q);
  endfunction
  
endclass