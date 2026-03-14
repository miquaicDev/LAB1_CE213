module decoder (in,en,out);
parameter width=5;
input wire [width-1:0] in;
input wire en;
output reg [(1<<width)-1:0] out;
always @(*) begin
if (!en)
	out=32'd0;
else
	out=32'b1<<in;
end
endmodule
