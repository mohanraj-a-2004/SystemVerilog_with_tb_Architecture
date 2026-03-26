program test(dff_intf intf);
  environment env;
  
  initial begin
    env = new(intf);
    env.run();
  end
  
endprogram