interface intf();
  
  logic a;
  logic b;
  logic c;
  logic sum;
  logic carry;
  logic diff;
  logic borrow;
  
  modport f_add (input a,b,c, output sum, carry);
  modport f_sub (input sum,carry,c, output diff, borrow);
  
    
endinterface