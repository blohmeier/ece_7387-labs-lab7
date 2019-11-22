`timescale 1ns / 1ps

module top_tb();
//Test Vector 1: Reset signal is functional during an idle cycle.

//Test Vectors 2, 3, 4: Subsystem 0 writes 16’hA5A5 to each of Subsystems 1, 2, and 3.
//Test Vectors 5, 6, 7: Subsystem 1 writes 16’h5A5A to each of Subsystems 0, 2, and 3.
//Test Vectors 8, 9, 10: Subsystem 2 writes 16’hC3C3 to each of Subsystems 0, 1, and 3.
//Test Vectors 11, 12 13: Subsystem 3 writes 16’h3C3C to each of Subsystems 0, 1, and 2.
//Test Vector 14: Reset signal is asserted during clock transaction cycle A when Subsystem 0 is writing 16’hF0F0 to Subsystem 1.
//Test Vector 15: Reset signal is asserted during transaction clock cycle B when Subsystem 0 is writing 16’h0F0F to Subsystem 1.
//Test Vector 16: Reset signal is asserted during transaction clock cycle C when Subsystem 0 is writing 16’hFF00 to Subsystem 1.
//Test Vectors (17/18): Arbiter input ctl[3:0] changes to 4’h9 during transaction clock cycle B when Subsystem 3 is already writing 16’hA50F to Subsystem 2.
//Test Vectors (19/20): Arbiter input ctl[3:0] changes to 4’h6 during transaction clock cycle C when Subsystem 0 is already writing 16’hF0F0 to Subsystem 1.


endmodule
