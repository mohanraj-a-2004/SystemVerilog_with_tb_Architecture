class driver;
  mailbox #(transaction)gen2drv;
  virtual m_1011 vif;
  
  function new(virtual m_1011 vif, mailbox #(transaction)gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    
    forever begin
      fork
        begin
      	transaction trans;
		gen2drv.get(trans);
          
        @(vif.cb);
      	vif.din <= trans.din;
        trans.display("driver");
    	end
        
        begin
          wait(vif.rst);
        end
      join_any
      
      disable fork;
        
	  if (vif.rst) begin
		 $display("%0t Driver: Reset started",$time);
		     			
        wait(!vif.rst);
		 $display("%0t Driver: Reset ended",$time);
       end
     end
  endtask
  
endclass
        