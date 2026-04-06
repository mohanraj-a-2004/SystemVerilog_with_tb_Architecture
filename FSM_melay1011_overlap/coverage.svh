class coverage;
  virtual m_1011 vif;
  
  covergroup cg @(posedge vif.clk);
    option.per_instance = 1;
    
    cp_rst: coverpoint vif.rst {
      bins rst_on = {1};
      bins rst_off = {0};
    }
    
    cp_din: coverpoint vif.din;
    
    cp_dout: coverpoint vif.dout {
      bins out_high = {1};
    }
    
    cp_seq: coverpoint vif.din {
      bins seq_1011 = (1 => 0 => 1 => 1);
    }
  endgroup
  
  function new(virtual m_1011 vif);
    this.vif = vif;
    cg = new();
  endfunction
  
endclass
