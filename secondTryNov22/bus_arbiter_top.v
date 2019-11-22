`timescale 1ns / 1ps

module bus_arbiter_top(     input clk,reset,
                            input [3:0] load,
                            input [15:0] din);

wire a, b, c, d, ab_oe, cd_oe, y;
wire load3, load2, load1, load0, din3, din2, din1, din0;

reg state;
wire transfer_sel, sender_en, ld_senderReceiver, receiver_we, set_busy, clr_busy, transfer, senderReceiver_eq;

reg16 SubSys3 (.clk(clk),.reset(reset),.load(load3),.din(din3));
reg16 SubSys2 (.clk(clk),.reset(reset),.load(load2),.din(din2));
reg16 SubSys1 (.clk(clk),.reset(reset),.load(load1),.din(din1));
reg16 SubSys0 (.clk(clk),.reset(reset),.load(load0),.din(din0));

datapath interconnect (.a(din3), .b(din2), .c(din1), .d(din0), .ab_oe(ab_oe), .cd_oe(cd_oe), .y(y));

controller arbiter (.state(state), .transfer_sel(transfer_sel), .sender_en(sender_en), .ld_senderReceiver(ld_senderReceiver), .receiver_we(receiver_we), .set_busy(set_busy), .clr_busy(clr_busy), .clk(clk), .reset(reset), .transfer(transfer), .senderReceiver_eq(senderReceiver_eq));

endmodule
