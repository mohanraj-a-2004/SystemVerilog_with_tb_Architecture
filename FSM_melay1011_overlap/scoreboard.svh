class scoreboard;
  mailbox #(transaction) mon2scb;
  virtual m_1011 vif;
  
  bit [3:0] shift_reg;
  
  function new(virtual m_1011 vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
    shift_reg = 4'b0000;
  endfunction
  
  task main();
    forever begin
      transaction trans;
      mon2scb.get(trans);
      
      if (vif.rst) begin
        shift_reg = 4'b0000; 
      end 
      else begin
         bit exp_dout = (shift_reg == 4'b1011);
        
        if (trans.dout !== exp_dout) begin
          $error("[%0t] Scoreboard Error: Expected dout: %0b, Got dout: %0b (shift_reg: %b)", 
                 $time, exp_dout, trans.dout, shift_reg);
        end 
        else 
          if (trans.dout == 1'b1) begin
          $display("[%0t] Scoreboard PASS: Sequence 1011 detected correctly!", $time);
        end
        
        shift_reg = {shift_reg[2:0], trans.din};
      end
    end
  endtask
endclass