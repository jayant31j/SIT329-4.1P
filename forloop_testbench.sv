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

    // Test cases using a for loop
    for (int i = 0; i < 8; i = i + 1) begin
      case (i)
        0: begin a = 3'b110; b = 3'b001; end
        1: begin a = 3'b010; b = 3'b011; end
        2: begin a = 3'b101; b = 3'b100; end
      endcase

      // Wait a bit before checking results
      #10;

      // Check results
      $display("Test %0d: a=%b, b=%b, A_greater_B=%b, A_equal_B=%b, A_smaller_B=%b", i, a, b, A_greater_B, A_equal_B, A_smaller_B);
      
      // Verify results
      if (a > b && !A_greater_B) begin
       
      end
      if (a == b && !A_equal_B) begin
       
      end
      if (a < b && !A_smaller_B) begin
       
      end
    end

    $display("Simulation completed.");
    $finish;
  end

endmodule
