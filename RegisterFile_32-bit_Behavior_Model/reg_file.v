
module reg_file (clk,RA1,RA2,RWE,WA,Wd,Rd1,Rd2);
parameter width=32;
input clk,RA1,RA2,RWE,WA,Wd;
wire [4:0] RA1;
wire [4:0] RA2;
wire [4:0] WA;
wire [31:0] Wd;
wire RWE;
output Rd1, Rd2;
wire [31:0] RSA;
wire [31:0] RSB;
wire [31:0] WS;
wire [31:0] Rd1;
wire [31:0] Rd2;
decoder inst0 (.in(WA),.en(RWE),.out(WS));
decoder inst1 (.in(RA1),.en(~RWE),.out(RSA));
decoder inst2 (.in(RA2),.en(~RWE),.out(RSB));
genvar k;
generate
	for(k=0; k<width; k=k+1) begin: reg_file_32
	reg_32bit rg (.RSA(RSA[k]),.RSB(RSB[k]),.WS(WS[k]),.in(Wd),.clk(clk),.rd1(Rd1),.rd2(Rd2) );
end
endgenerate
endmodule