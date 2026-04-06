class monitor;
  mailbox #(transaction)mon2scb;
  virtual m_1011 vif;
  
  function new(virtual m_1011 vif, mailbox #(transaction)mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main ();
    
    forever begin
      transaction trans;
      trans = new();
      
      @(vif.cb);
      trans.din = vif.din;
      trans.dout = vif.cb.dout;
      
      trans.display("monitor");
      mon2scb.put(trans);
      
    end
  endtask
  
endclass
      