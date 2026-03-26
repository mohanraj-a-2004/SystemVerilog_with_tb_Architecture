interface dff_intf (input logic clk, rst);
  
  logic d;
  logic q;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    
    output d;
    input q;
  endclocking
  
endinterface