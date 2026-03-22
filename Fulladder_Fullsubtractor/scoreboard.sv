class scoreboard;
  mailbox mon2scb;
  event handshake;
  
  function new (mailbox mon2scb, event handshake);
        this.mon2scb = mon2scb;
    	this.handshake = handshake;
  endfunction
  
  task main();
    repeat(8) begin
    
    transaction trans;
    
     mon2scb.get(trans);
      $display("%0t scoreboard: a= %0b, b= %0b, c= %0b, sum= %0b, carry= %0b, diff= %0b, borrow= %0b",$time, trans.a, trans.b, trans.c, trans.sum, trans.carry, trans.diff, trans.borrow);

    if(( ( ( trans.a ^ trans.b ^ trans.c) == trans.sum) && ((( trans.a & trans.b ) | ( trans.b & trans.c ) | ( trans.c & trans.a )) == trans.carry)) && ((( trans.sum ^ trans.carry ^ trans.c) == trans.diff) && ((( (~trans.sum) & trans.carry ) | ( trans.carry & trans.c ) | ( trans.c & (~trans.sum) )) == trans.borrow)))
       $display("PASS ");
        
      else
      $display("FAIL"); 
      ->handshake;
    end


  endtask
  
endclass