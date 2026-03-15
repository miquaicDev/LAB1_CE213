module mux21_1bit(input sel, a, b, output out);
  wire sel_n, w1, w2;
  not n1(sel_n, sel);
  //sel'*a + sel*b
  and n2(w1, sel_n, a);
  and n3(w2, sel, b);
  or n4(out, w1, w2);
endmodule