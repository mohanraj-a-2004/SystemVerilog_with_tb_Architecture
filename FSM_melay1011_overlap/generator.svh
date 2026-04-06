class generator;
  mailbox #(transaction)gen2drv;
  event ended;
  
  function new(mailbox #(transaction)gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    
    repeat (20) begin
      	transaction trans;
    	trans = new();
    	if (!trans.randomize()) $error("Randomize error");
    	
        trans.display("generator");
    	gen2drv.put(trans);
    end
    ->ended;
  endtask
endclass
