class generator;
   mailbox gen2drv;
   event handshake;
 
  function new(mailbox gen2drv, event handshake);
    this.gen2drv = gen2drv;
    this.handshake = handshake;
  endfunction
 
  task main();
    repeat(8) begin
 
    transaction trans;
 
    trans = new();
 
    trans.randomize();
 
      $display("%0t generator: a= %0b, b= %0b, c= %0b, sum= %0b, carry= %0b, diff= %0b, borrow= %0b",$time, trans.a, trans.b, trans.c, trans.sum, trans.carry, trans.diff, trans.borrow);
 
    gen2drv.put(trans);
    @(handshake);  
    end
     
  endtask
 
endclass
