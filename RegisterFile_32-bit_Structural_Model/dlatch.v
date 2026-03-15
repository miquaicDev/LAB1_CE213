// a dlatch made from SR latch
module dlatch(input en, d, output q, qbar);
  wire dbar, s, r;
  not n1 (dbar, d); // inverse d
  // s, r function:
  nand n2(s, en, d);
  nand n3(r, en, dbar);
  // q, qbar function:
  nand n4(q, qbar, s);
  nand n5(qbar, q, r);
endmodule
  