module half_adder(
		input a, b,
		output sum, carry
		);
  
  assign sum = a ^ b ;
  assign carry = a & b;
  
endmodule

module full_adder(
		input a, b, c,
		output sum, carry
		);
  
  wire i1, i2, i3;
  
  half_adder ha1 (.a(a), .b(b), .sum(i1), .carry(i2));
  half_adder ha2(.a(i1), .b(c), .sum(sum), .carry(i3));
  
  assign carry = i2 | i3;
  
endmodule

module half_sub(
		input a, b,
		output diff, borrow
		);
  
  assign diff = a ^ b ;
  assign borrow = (~a) & b;
  
endmodule

module full_sub(
		input a, b, c,
		output diff, borrow
		);
  
  wire i1, i2, i3;
  
  half_sub sub1 (.a(a), .b(b), .diff(i1), .borrow(i2));
  half_sub sub2(.a(i1), .b(c), .diff(diff), .borrow(i3));
  
  assign borrow = i2 | i3;
  
endmodule

module top_design (intf intff);
  
  full_adder fa(.a(intff.a), .b(intff.b), .c(intff.c), .sum(intff.sum), .carry(intff.carry));
  full_sub fs(.a(intff.sum), .b(intff.carry), .c(intff.c), .diff(intff.diff), .borrow(intff.borrow));
  
endmodule