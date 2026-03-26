class monitor;
  virtual dff_intf vif;
  mailbox mon2scb;
  
  function new (virtual dff_intf vif,mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    forever begin
      
      transaction trans;
      trans = new();
      
      @(vif.cb);
      trans.d = vif.d;
      trans.q = vif.cb.q;
      
      trans.display("monitor");
      mon2scb.put(trans);
            
    end
  endtask
  
endclass