interface dff_intf (input logic clk, rst);
  
  logic d;
  logic q;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    
    output d;
    input q;
  endclocking
  
  always_comb begin
    if (!rst) begin
      Reset_Check: assert #0 (q == 1'b0)
        $info("[%0t] PASS : -----RESET-----", $time); 
      else 
        $error("[%0t] SVA Error: Q did not clear asynchronously on reset", $time);
    end
  end
  
  property p_d_to_q;
    @(posedge clk) disable iff (!rst)
    1'b1 |=> (q == $past(d)); 
  endproperty
  
  D_to_Q: assert property (p_d_to_q)
    		$info("PASS : -----D_to_Q-----");
    	  else 
      		$error("[%0t] SVA Error: D value did not transfer to Q", $time);
  
endinterface
