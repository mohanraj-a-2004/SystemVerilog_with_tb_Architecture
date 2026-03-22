class driver;
  virtual intf vif;
   mailbox gen2drv;
 
  function new(virtual intf vif, mailbox gen2drv);
    this.vif=vif;
    this.gen2drv = gen2drv;
  endfunction
 
  task main();
    repeat(8) begin
 
    transaction trans;
 
    gen2drv.get(trans);
 
    vif.a <= trans.a;
    vif.b <= trans.b;
    vif.c <= trans.c;
    //vif.sum <= trans.sum;
    //vif.carry <= trans.carry;
 	
      $display("%0t driver: a= %0b, b= %0b, c= %0b, sum= %0b, carry= %0b, diff= %0b, borrow= %0b", $time, trans.a, trans.b, trans.c, trans.sum, trans.carry, trans.diff, trans.borrow);
  
    #1;
    end
 
  endtask
 
endclass
