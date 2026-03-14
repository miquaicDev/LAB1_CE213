
module decoder2_to_4 ( y0, y1, y2, y3, s1, s0 );
output y0, y1, y2, y3;
input s1, s0;
wire s1n, s0n;
not ( s1n, s1 );
not ( s0n, s0 );
and ( y0, s1n, s0n );
and ( y1, s1n, s0 );
and ( y2, s1, s0n );
and ( y3, s1, s0 );
endmodule