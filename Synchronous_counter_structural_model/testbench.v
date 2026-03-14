`timescale 1ns/1ps
module testbench ();
parameter clock_cycle=20;
reg clk;
reg [2:0] pre,clr;
wire [2:0] state;
Synchronous_counter inst (.clk(clk),.clr(clr),.pre(pre),.state(state));
always begin
	#(clock_cycle/2) clk=~clk;
end
initial begin
	clk=0;
	pre = 3'b111; 
        clr = 3'b111;

        // Ep clear=000, preset khong tich cuc: mach bat dau tu trang thai 000
        pre = 3'b111; clr = 3'b000; 
	#clock_cycle;
        pre = 3'b111; clr = 3'b111; // Tha nut pre,clr
        #(clock_cycle*6);

        // Ép thành 001: mach bat dau tu trang thai 001
        pre = 3'b110; clr = 3'b001; 
       	#clock_cycle;
        pre = 3'b111; clr = 3'b111; // Tha nut pre,clr
        #(clock_cycle*3);

        // Ép thành 101: mach bat dau tu trang thai 101
        pre = 3'b010; clr = 3'b101; 
	#clock_cycle;
        pre = 3'b111; clr = 3'b111; // Tha nut pre,clr
        #(clock_cycle*3);

         // Ép thành 010: mach bat dau tu trang thai 101
        pre = 3'b101; clr = 3'b010; 
        #clock_cycle;
        pre = 3'b111; clr = 3'b111; // Tha nut pre,clr
        #(clock_cycle*3);
    end
endmodule
