`timescale 1ns/1ps
module rf32x32_tb();
  
    reg ReadWriteEn, clk;
    reg [4:0]WriteAddress, ReadAddress1, ReadAddress2;
    reg [31:0]WriteData;
    wire [31:0] ReadData1, ReadData2;
    
    rf32x32 rf(ReadWriteEn, WriteAddress, ReadAddress1, ReadAddress2, WriteData, clk, ReadData1, ReadData2);
    
    initial clk=0;
    always #5 clk=~clk;
    
  initial begin

  $display("time\tWE\tWaddr\tWdata\tRaddr1\tRdata1\tRaddr2\tRdata2");
  $monitor("%0t\t%b\t%d\t%d\t%d\t%d\t%d\t%d",
           $time, ReadWriteEn, WriteAddress, WriteData,
           ReadAddress1, ReadData1, ReadAddress2, ReadData2);

  ReadWriteEn = 0;
  WriteAddress = 0;
  WriteData = 0;
  ReadAddress1 = 0;
  ReadAddress2 = 0;

  repeat(2) @(negedge clk);

  // Test 1: write reg0
  ReadWriteEn = 1;
  WriteAddress = 0;
  WriteData = 32'd17;
  ReadAddress1 = 0;
  ReadAddress2 = 1;
  @(negedge clk);

  // Test 2: write reg2
  WriteAddress = 2;
  WriteData = 32'd32;
  ReadAddress1 = 0;
  ReadAddress2 = 2;
  @(negedge clk);

  // Test 3: read
  ReadWriteEn = 0;
  ReadAddress1 = 0;
  ReadAddress2 = 2;
  @(negedge clk);

  // Test 4: write reg5, 10, 15
  ReadWriteEn = 1;
  WriteAddress = 5;
  WriteData = 32'd55;
  @(negedge clk);

  WriteAddress = 10;
  WriteData = 32'd100;
  @(negedge clk);

  WriteAddress = 15;
  WriteData = 32'd150;
  @(negedge clk);

  // Test 5: read 5,10,15,0
  ReadWriteEn = 0;
  ReadAddress1 = 5;
  ReadAddress2 = 10;
  @(negedge clk);

  ReadAddress1 = 15;
  ReadAddress2 = 0;
  @(negedge clk);

  // Test 6: overwrite reg2
  ReadWriteEn = 1;
  WriteAddress = 2;
  WriteData = 32'd999;
  @(negedge clk);

  // read reg2
  ReadWriteEn = 0;
  ReadAddress1 = 2;
  ReadAddress2 = 10;
  @(negedge clk);

  repeat(3) @(negedge clk);

  $display("Finished");
  $stop;

  end

endmodule