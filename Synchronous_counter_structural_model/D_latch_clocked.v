// tao D_latch theo xung clock
module D_latch_clocked (clk,D,clr,Q,Qbar);
input clk,D,clr;
output Q,Qbar;
wire Dbar,clkbar,clrbar;
wire x,y,z; 

not a0 (Dbar,D);
not a1 (clkbar,clk);
not a2 (clrbar,clr);
not a3 (prebar, pre);

nand nand_S (S_n, D, clk, clr);
nand nand_R (R_n, Dbar, clk, pre);

or or0 (x,Dbar,clkbar);
or or1 (y,clkbar,clr);
or or2 (z,x,clr);
nand nand0 (Q,z,Qbar);
nand nand1 (Qbar,y,Q);
endmodule
