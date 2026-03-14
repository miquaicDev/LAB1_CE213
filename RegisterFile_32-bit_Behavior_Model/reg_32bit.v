module reg_32bit (RSA,RSB,WS,in,clk, rd1,rd2);
input RSA,RSB,WS,clk;
input wire [31:0] in;
output wire [31:0] rd1,rd2;
genvar i;
generate 
for (i=0; i<32; i=i+1) begin: reg_32
		file_cell fc (
		.in(in[i]),
		.ws(WS),
		.clk(clk),
		.rsa(RSA),
		.rsb(RSB),
		.A(rd1[i]),
		.B(rd2[i])
);
end
endgenerate

endmodule
