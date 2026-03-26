class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  coverage cov;
  
  mailbox gen2drv;
  mailbox mon2scb;
  
  virtual dff_intf vif;
  
  function new(virtual dff_intf vif);
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
      //drv.reset();
    join_any
  endtask
  
  task run();
    //drv.reset();
    test();
    wait(gen.ended.triggered);
    #100;
    $finish;
  endtask
    
endclass

  
  
    