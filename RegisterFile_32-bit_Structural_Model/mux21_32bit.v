// mux 2:1 32bit wide using generate block
module mux21_32bit(input sel, input [31:0]a, b, output [31:0]out);
  genvar i;
  generate
    for(i=0; i<32; i=i+1)
    begin: forLoop
      mux21_1bit m(sel, a[i], b[i], out[i]);
    end
  endgenerate
endmodule