// a simple dff made by master-slave strategy
module dff(input d, clk, output q, qbar);
  wire clkbar, qmaster, qbarmaster;
  not n1(clkbar, clk);
  dlatch master(.d(d), .en(clkbar), .q(qmaster), .qbar(qbarmaster));
  dlatch slave(.d(qmaster), .en(clk), .q(q), .qbar(qbar));
endmodule