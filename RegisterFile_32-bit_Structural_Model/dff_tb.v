`timescale 1ns/1ps
module dff_tb();
  reg d, clk;
  wire q, qbar;
  
  dff dut(d, clk, q, qbar);
  
  initial clk=0;
  always #5 clk=~clk;
  
  initial begin
    d=0;
    @(negedge clk);
    d=1;
    @(negedge clk);
    d=0;
    repeat(5) @(negedge clk);
    d=1;
    @(negedge clk);
    d=0;
    repeat(10) @(negedge clk);
    $stop;
  end
  
endmodule