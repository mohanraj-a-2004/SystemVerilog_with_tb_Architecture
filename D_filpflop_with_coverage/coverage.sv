class coverage;
  virtual dff_intf vif;
  
  covergroup cg @(vif.cb);
    option.per_instance= 1;
    
    cp_rst: coverpoint vif.rst{
      bins active = {0};
      bins inactive = {1};
    }
    
    cp_d: coverpoint vif.d{
      bins logic_0 = {0};
      bins logic_1 = {1};
      bins trans_01 = (0 => 1);
      bins logic_10 = (1 => 0);
    }
    
    cp_q: coverpoint vif.cb.q{
      bins logic_0 = {0};
      bins logic_1 = {1};
    }
  endgroup
  
  function new(virtual dff_intf vif);
    this.vif = vif;
    cg = new();
  endfunction
  
endclass