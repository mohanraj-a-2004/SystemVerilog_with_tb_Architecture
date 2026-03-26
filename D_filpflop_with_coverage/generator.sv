class generator;
  mailbox gen2drv;
  event ended;
  
  function new (mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    repeat(10) begin
      
       transaction trans;
       trans = new();
      
       if (!trans.randomize())
  		$error("Randomization failed");
      
      trans.display("generator");
      
      gen2drv.put(trans);
      
      end
    ->ended;
  endtask
  
endclass
  