class monitor;
  virtual intf vif;
   mailbox mon2scb;
 
  function new(virtual intf vif, mailbox mon2scb);
    this.vif=vif;
    this.mon2scb = mon2scb;
  endfunction
 
  task main();
    repeat(8) begin
 
    transaction trans;
 
    trans= new();
     #1;
     trans.a = vif.a;
     trans.b = vif.b;
     trans.c = vif.c;
     trans.sum = vif.sum;
     trans.carry = vif.carry;
     trans.diff = vif.diff;
     trans.borrow = vif.borrow;
 
      $display("%0t monitor:a= %0b, b= %0b, c= %0b, sum= %0b, carry= %0b, diff= %0b, borrow= %0b",$time, trans.a, trans.b, trans.c, trans.sum, trans.carry, trans.diff, trans.borrow);
  
    mon2scb.put(trans);
    end
    
 
  endtask
 
endclass
