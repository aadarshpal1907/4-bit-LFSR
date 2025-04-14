`timescale 1ns / 1ps

module lfsr_tb;

  // Declare signals
  reg clk;
  reg rst;
  wire [3:0] x;
  
  // Instantiate the Device Under Test (DUT)
  lfsr dut (
    .clk(clk),
    .rst(rst),
    .x(x)
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end
  
  // Test stimulus
  initial begin
    // Initialize and apply reset
    rst = 1;
    #15; // Hold reset for 15ns
    rst = 0;
    
    // Run for several clock cycles to observe LFSR sequence
    #200;
    
    // End simulation
    $finish;
  end
  
  // Monitor the output
  initial begin
    $monitor("Time = %0t, Reset = %b, LFSR Output = %b", $time, rst, x);
  end
  
endmodule
