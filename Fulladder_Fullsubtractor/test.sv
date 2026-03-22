`include "environment.sv"

program test (intf intff);
  environment env;
 
  initial begin
    env = new(intff);
    env.run_test();
  end
 
endprogram
