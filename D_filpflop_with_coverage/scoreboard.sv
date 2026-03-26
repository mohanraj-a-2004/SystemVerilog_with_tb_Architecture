class scoreboard;
  mailbox mon2scb;
  virtual dff_intf vif;
  bit expected_q;
  
  function new (virtual dff_intf vif,mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
    this.expected_q = 0;
  endfunction
  
  task main();
    forever begin
      
      transaction trans;
      mon2scb.get(trans);
      
      if (!vif.rst) begin
        $display("[%0t] Scoreboard: Reset active. Clearing expected value to 0.", $time);
        expected_q = 0; 
      end 
      
      else begin 
      
      	if (trans.q == expected_q)
        	$display("[%0t] Scoreboard: PASS | Expected: %0b, Actual: %0b", $time, expected_q, trans.q);
      	else
        	$display("[%0t] Scoreboard: FAIL | Expected: %0b, Actual: %0b", $time, expected_q, trans.q);
      
      expected_q = trans.d;
      end

    end
  endtask
  
endclass