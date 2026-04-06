class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  coverage cov;
  
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) mon2scb;
  
  virtual m_1011 vif;
  
  function new (virtual m_1011 vif);
    this.vif = vif;
    
    gen2drv = new();
    mon2scb = new();
    
    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    scb = new(vif,mon2scb);
    cov = new(vif);
  endfunction
  
  task test();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join_any
  endtask
  
  task run();
    test();
    wait(gen.ended.triggered);
    #300;
    $finish;
  endtask
  
endclass
