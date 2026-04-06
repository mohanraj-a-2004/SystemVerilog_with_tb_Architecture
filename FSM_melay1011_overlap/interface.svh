interface m_1011 (input logic clk, rst);
  
  logic din, dout;
  
  clocking cb @(posedge clk);
    default input #1step output #1;
    
    output din;
    input dout;
  endclocking
  
  property rst_check;
    @(posedge clk) rst |=> (dout == 1'b0);
  endproperty
  
  Reset_Assertion: assert property(rst_check) 
    else $error("[%0t] SVA Error: Dout did not clear on reset", $time);

   property seq_1011_check;
    @(posedge clk) disable iff (rst)
    (din ##1 !din ##1 din ##1 din) |=> (dout == 1'b1);
  endproperty
  
  Seq_Assertion: assert property(seq_1011_check)
    else $error("[%0t] SVA Error: Sequence 1011 did not trigger dout", $time);
  
endinterface