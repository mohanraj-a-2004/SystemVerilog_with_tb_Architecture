program test(m_1011 intf);
  environment env;
  
  initial begin
    env = new(intf);
    env.run();
  end
  
endprogram
