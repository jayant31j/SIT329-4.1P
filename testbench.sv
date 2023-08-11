`timescale 1ns/1ns

module tb_threebit;

  // Inputs
  reg [2:0] a;
  reg [2:0] b;

  // Outputs
  wire A_greater_B;
  wire A_equal_B;
  wire A_smaller_B;

  // Instantiate the threebit module
  threebit dut (
    .a(a),
    .b(b),
    .A_greater_B(A_greater_B),
    .A_equal_B(A_equal_B),
    .A_smaller_B(A_smaller_B)
  );

  // Generate clock signal
  reg clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    $display("Starting simulation...");

    // Test cases
    // Test case 1: a=6, b=1
    a = 3'b110;
    b = 3'b001;
    #10;
    $display("Test 1: a=%b, b=%b, A_greater_B=%b, A_equal_B=%b, A_smaller_B=%b", a, b, A_greater_B, A_equal_B, A_smaller_B);
    
    // Test case 2: a=2, b=3
    a = 3'b010;
    b = 3'b011;
    #10;
    $display("Test 2: a=%b, b=%b, A_greater_B=%b, A_equal_B=%b, A_smaller_B=%b", a, b, A_greater_B, A_equal_B, A_smaller_B);
    
    // Test case 3: a=5, b=4
    a = 3'b101;
    b = 3'b100;
    #10;
    $display("Test 3: a=%b, b=%b, A_greater_B=%b, A_equal_B=%b, A_smaller_B=%b", a, b, A_greater_B, A_equal_B, A_smaller_B);
    
    $display("Simulation completed.");
    $finish;
  end

endmodule
