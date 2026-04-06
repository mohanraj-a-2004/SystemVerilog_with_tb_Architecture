`include "interface.svh"
`include "transaction.svh"
`include "generator.svh"
`include "driver.svh"
`include "monitor.svh"      
`include "scoreboard.svh"
`include "coverage.svh"
`include "environment.svh"
`include "test.svh"

module top;
  
  bit clk;
  bit rst;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    rst = 1;
    #15; 
    rst = 0;
    #28;
    rst = 1;
    #20;
    rst = 0;
  end
  
  m_1011 intf(clk, rst);
  
  melay_1011 dut(.clk(intf.clk),
                 .rst(intf.rst),
                 .din(intf.din),
                 .dout(intf.dout)
                ); 
  
  test tst (intf);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,top);
  end
  
endmodule