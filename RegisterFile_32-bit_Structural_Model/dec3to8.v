module dec3to8(input en, input [2:0] addr, output [7:0] out);

  wire en0, en1;
  wire addr2_n;

  not n1(addr2_n, addr[2]);

  and a1(en0, en, addr2_n);
  and a2(en1, en, addr[2]);

  dec2to4 d0(en0, addr[1:0], out[3:0]);
  dec2to4 d1(en1, addr[1:0], out[7:4]);

endmodule
