module reg32(input [31:0]d, input clk, en, output [31:0] q);
  // directly create this module instead of regcell first
  // register 32 bit with enable port
  wire[31:0]mux_out;
  wire[31:0]qbar;
  genvar i;
  generate
    for(i=0; i<32; i=i+1)
    begin: gen_reg
      mux21_1bit m(.sel(en), .a(q[i]), .b(d[i]), .out(mux_out[i]));
      dff ff(.d(mux_out[i]), .clk(clk), .q(q[i]), .qbar(qbar[i]));
    end
  endgenerate
      
endmodule
