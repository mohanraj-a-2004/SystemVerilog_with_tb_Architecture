`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "coverage.sv"
`include "environment.sv"
`include "test.sv"

module top;
  logic clk;
  logic rst;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  initial begin
    rst = 0;
    #15; 
    rst = 1;
    #28;
    rst = 0;
    #20;
    rst = 1;
  end
  
  dff_intf intf(clk, rst);
  
  dff dut (.clk(intf.clk),
    	   .rst(intf.rst),
    	   .d(intf.d),
    	   .q(intf.q)
  		    );
   test tst(intf);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,top);
  end
  
endmodule
 