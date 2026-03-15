module dec4to16(input en, input [3:0] addr, output [15:0] out);

  wire en0, en1;
  wire addr3_n;

  not n1(addr3_n, addr[3]);

  and a1(en0, en, addr3_n);
  and a2(en1, en, addr[3]);

  dec3to8 d0(en0, addr[2:0], out[7:0]);
  dec3to8 d1(en1, addr[2:0], out[15:8]);

endmodule
