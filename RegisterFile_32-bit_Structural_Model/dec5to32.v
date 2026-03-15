module dec5to32(input [4:0]addr, output [31:0]out, input en);
  wire en0, en1, addr4_n;
  not(addr4_n, addr[4]);
  and(en0, en, addr4_n);
  and(en1, en, addr[4]);
  
  dec4to16 d1(en0, addr[3:0], out[15:0]);
  dec4to16 d2(en1, addr[3:0], out[31:16]);
endmodule