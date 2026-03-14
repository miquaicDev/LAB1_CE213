`timescale 1ns/1ps
module testbench();
parameter width = 32;
reg clk;
reg [4:0] RA1;
reg [4:0] RA2;
reg RWE;
reg [4:0] WA;
reg [31:0] Wd;

wire [31:0] Rd1;
wire [31:0] Rd2;

reg_file inst (
    .clk(clk),
    .RA1(RA1),
    .RA2(RA2),
    .RWE(RWE),
    .WA(WA),
    .Wd(Wd),
    .Rd1(Rd1),
    .Rd2(Rd2)
);
always begin
 #10 clk = ~clk;
end

initial begin
    clk = 0;
    RWE = 0;
    WA = 5'd0;
    Wd = 32'd0;
    RA1 = 5'd0;
    RA2 = 5'd0;

    #20;
    RWE = 1;
    WA = 5'd5;
    Wd = 32'hAAB;
    
    #20;
    RWE = 1;
    WA = 5'd10;
    Wd = 32'h555;
    
    #20;
    RWE = 0;
    RA1 = 5'd5;
    RA2 = 5'd10;

    #40;
    $stop;
end

endmodule
