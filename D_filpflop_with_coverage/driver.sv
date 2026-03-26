class driver;
  virtual dff_intf vif;
  mailbox gen2drv;
  
  function new (virtual dff_intf vif,mailbox gen2drv);
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
     	 	vif.cb.d <= trans.d;
      	
      		trans.display("driver");
      	end
        
        begin
          wait(!vif.rst);
        end
      join_any
      
      disable fork;
    
      if (!vif.rst) begin
    	$display("%0t Driver: Reset started",$time);
    	vif.d<=0;
    			
    	wait(vif.rst);
    	$display("%0t Driver: Reset ended",$time);
      end
        end
    
  endtask
  
endclass
  