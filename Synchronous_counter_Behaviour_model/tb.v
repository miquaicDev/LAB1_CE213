//timescale
`timescale 1ns/1ps

module tb_counter();

    //vars
    reg clk, LE;
    reg [2:0] in;
    wire [2:0] out;
    
    //invoke module
    counter3bit dut (clk, LE, in, out);
    //clk
    initial clk=0;
    always #5 clk=~clk;
    //test
initial begin

    $monitor("time=%0t q=%b", $time, out);

    LE = 1;
    in = 3'b000;

    @(posedge clk);
    LE = 0;

    repeat(5) @(negedge clk);

    @(negedge clk);
    LE = 1;
    in = 3'b101;

    @(negedge clk);
    LE = 0;
    @(negedge clk);
    LE = 1;
    in = 3'b011;
    @(negedge clk);
    LE = 0;

    repeat(10) @(negedge clk);

    $stop;

end
endmodule

