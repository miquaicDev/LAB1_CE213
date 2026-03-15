module counter3bit(
    input clk,
    input LE,
    input [2:0] in,
    output reg [2:0] q
);

reg [2:0] next_state;


// Next-state logic
always @(*) begin
    case(q)
        3'b000: next_state = 3'b110;
        3'b001: next_state = 3'b110;
        3'b010: next_state = 3'b111;
        3'b011: next_state = 3'b000;
        3'b100: next_state = 3'b111;
        3'b101: next_state = 3'b010;
        3'b110: next_state = 3'b100;
        3'b111: next_state = 3'b011;
        default: next_state = 3'b000;
    endcase
end


// State register
always @(posedge clk or posedge LE) begin
    if (LE)
        q <= in;
    else
        q <= next_state;
end

endmodule
