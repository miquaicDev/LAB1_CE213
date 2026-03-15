// main file
module rf32x32(input ReadWriteEn, input [4:0]WriteAddress, ReadAddress1, ReadAddress2, input [31:0]WriteData, input clk, output [31:0] ReadData1, ReadData2);
  wire [31:0]decOut;
  wire [31:0]w_out[31:0];
  dec5to32 d1(WriteAddress, decOut, ReadWriteEn);
  
  genvar i;
  generate
    for(i=0; i<32; i=i+1)
    begin: rf32x32
      reg32 r(WriteData, clk, decOut[i], w_out[i]);
    end
  endgenerate
  

  mux32to1_32bit m1(
    ReadAddress1,
    w_out[0], w_out[1], w_out[2], w_out[3],
    w_out[4], w_out[5], w_out[6], w_out[7],
    w_out[8], w_out[9], w_out[10], w_out[11],
    w_out[12], w_out[13], w_out[14], w_out[15],
    w_out[16], w_out[17], w_out[18], w_out[19],
    w_out[20], w_out[21], w_out[22], w_out[23],
    w_out[24], w_out[25], w_out[26], w_out[27],
    w_out[28], w_out[29], w_out[30], w_out[31],
    ReadData1
);

  mux32to1_32bit m2(
    ReadAddress2,
    w_out[0], w_out[1], w_out[2], w_out[3],
    w_out[4], w_out[5], w_out[6], w_out[7],
    w_out[8], w_out[9], w_out[10], w_out[11],
    w_out[12], w_out[13], w_out[14], w_out[15],
    w_out[16], w_out[17], w_out[18], w_out[19],
    w_out[20], w_out[21], w_out[22], w_out[23],
    w_out[24], w_out[25], w_out[26], w_out[27],
    w_out[28], w_out[29], w_out[30], w_out[31],
    ReadData2);
endmodule