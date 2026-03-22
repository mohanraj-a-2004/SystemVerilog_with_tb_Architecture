`include "interface.sv"
`include "test.sv"

module top;
 
  intf intff();
  test tst (intff);
 
  top_design dut(intff);
 
initial begin
    $dumpfile("dump.vcd");
  $dumpvars(0, top);
  end
 
endmodule