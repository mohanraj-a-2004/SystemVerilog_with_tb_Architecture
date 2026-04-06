class transaction;
  
  rand bit din;
  bit dout;
  
  function void display(string name);
    $display("%0t %s: din: %0b, dout:%0b", $time, name, din, dout);
  endfunction
  
endclass
