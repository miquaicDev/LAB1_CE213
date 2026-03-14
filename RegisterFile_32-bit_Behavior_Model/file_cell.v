module file_cell (in,ws,clk,rsa,rsb,A,B);
input in,ws,clk,rsa,rsb;
reg w0;
output A,B;
always @(posedge clk) begin 
if (ws==1'b1) begin
 w0<=in;
 end
end
assign A=(rsa)?w0:1'bz;
assign B=(rsb)?w0:1'bz;
endmodule
