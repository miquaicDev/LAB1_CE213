// use 31 mux21 to create mux32to1
module mux32to1_32bit(
    input [4:0] sel,
    input [31:0] in0,  input [31:0] in1,
    input [31:0] in2,  input [31:0] in3,
    input [31:0] in4,  input [31:0] in5,
    input [31:0] in6,  input [31:0] in7,
    input [31:0] in8,  input [31:0] in9,
    input [31:0] in10, input [31:0] in11,
    input [31:0] in12, input [31:0] in13,
    input [31:0] in14, input [31:0] in15,
    input [31:0] in16, input [31:0] in17,
    input [31:0] in18, input [31:0] in19,
    input [31:0] in20, input [31:0] in21,
    input [31:0] in22, input [31:0] in23,
    input [31:0] in24, input [31:0] in25,
    input [31:0] in26, input [31:0] in27,
    input [31:0] in28, input [31:0] in29,
    input [31:0] in30, input [31:0] in31,
    output [31:0] out
);

wire [31:0] w1 [15:0];
wire [31:0] w2 [7:0];
wire [31:0] w3 [3:0];
wire [31:0] w4 [1:0];

mux21_32bit m0 (sel[0], in0,  in1,  w1[0]);
mux21_32bit m1 (sel[0], in2,  in3,  w1[1]);
mux21_32bit m2 (sel[0], in4,  in5,  w1[2]);
mux21_32bit m3 (sel[0], in6,  in7,  w1[3]);
mux21_32bit m4 (sel[0], in8,  in9,  w1[4]);
mux21_32bit m5 (sel[0], in10, in11, w1[5]);
mux21_32bit m6 (sel[0], in12, in13, w1[6]);
mux21_32bit m7 (sel[0], in14, in15, w1[7]);
mux21_32bit m8 (sel[0], in16, in17, w1[8]);
mux21_32bit m9 (sel[0], in18, in19, w1[9]);
mux21_32bit m10(sel[0], in20, in21, w1[10]);
mux21_32bit m11(sel[0], in22, in23, w1[11]);
mux21_32bit m12(sel[0], in24, in25, w1[12]);
mux21_32bit m13(sel[0], in26, in27, w1[13]);
mux21_32bit m14(sel[0], in28, in29, w1[14]);
mux21_32bit m15(sel[0], in30, in31, w1[15]);

mux21_32bit m16(sel[1], w1[0], w1[1], w2[0]);
mux21_32bit m17(sel[1], w1[2], w1[3], w2[1]);
mux21_32bit m18(sel[1], w1[4], w1[5], w2[2]);
mux21_32bit m19(sel[1], w1[6], w1[7], w2[3]);
mux21_32bit m20(sel[1], w1[8], w1[9], w2[4]);
mux21_32bit m21(sel[1], w1[10], w1[11], w2[5]);
mux21_32bit m22(sel[1], w1[12], w1[13], w2[6]);
mux21_32bit m23(sel[1], w1[14], w1[15], w2[7]);

mux21_32bit m24(sel[2], w2[0], w2[1], w3[0]);
mux21_32bit m25(sel[2], w2[2], w2[3], w3[1]);
mux21_32bit m26(sel[2], w2[4], w2[5], w3[2]);
mux21_32bit m27(sel[2], w2[6], w2[7], w3[3]);

mux21_32bit m28(sel[3], w3[0], w3[1], w4[0]);
mux21_32bit m29(sel[3], w3[2], w3[3], w4[1]);

mux21_32bit m30(sel[4], w4[0], w4[1], out);

endmodule