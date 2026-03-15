module dec2to4(input en, input [1:0] addr, output [3:0] out);

  wire a0n, a1n;

  not n1(a0n, addr[0]);
  not n2(a1n, addr[1]);

  and a1(out[0], en, a1n, a0n);
  and a2(out[1], en, a1n, addr[0]);
  and a3(out[2], en, addr[1], a0n);
  and a4(out[3], en, addr[1], addr[0]);

endmodule