`timescale 1ns / 1ps

module datapath (a, b, c, d, ab_oe, cd_oe, y);
input ab_oe,cd_oe;
input [15:0] a,b,c,d;
output [15:0] y;

wire [15:0] p,q;

//			ab_oe=1 ab_oe=0
assign p = ~ab_oe ? a : 16'bzzzzzzzzzzzzzzzz;
assign p = ab_oe ? b : 16'bzzzzzzzzzzzzzzzz;
//			cd_oe=1 cd_oe=0
assign q = ~cd_oe ? c : 16'bzzzzzzzzzzzzzzzz;
assign q = cd_oe ? d : 16'bzzzzzzzzzzzzzzzz;

assign y = p + q;
endmodule
