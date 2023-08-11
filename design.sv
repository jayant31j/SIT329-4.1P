`timescale 1ns/1ns
// Half adder
module halfadder (
  input a, b,
  output reg sum, cout
);
  
  always @(*) begin
    sum = a ^ b;
    cout = a & b;
  end
  
endmodule

// Full adder

module fulladder (
  input a, b, ci,
  output reg s, co
);
  always @(*) begin
    s = a ^ (b ^ ci);
    co = (a & b) | (ci & (a ^ b));
  end
endmodule

// Three-bit comparator
module threebit (
  input [2:0] a, b,
  output A_greater_B,
  output A_equal_B,
  output A_smaller_B
);
  wire cO, c1;
  halfadder h1(.a(a[0]), .b(b[0]), .sum(A_smaller_B), .cout(cO));
  fulladder f1(.a(a[1]), .b(b[1]), .ci(cO), .s(A_equal_B), .co(c1));
  fulladder f2(.a(a[2]), .b(b[2]), .ci(c1), .s(A_greater_B), .co());
endmodule
