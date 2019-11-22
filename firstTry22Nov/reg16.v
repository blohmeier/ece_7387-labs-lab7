`timescale 1ns / 1ps

module reg16(clk,reset,load,din);
    input clk,reset,load;
    inout [15:0]din;
    reg [15:0]dout;
    
    always @(posedge clk or posedge reset)
        begin
            if (reset == 1'b1) // asynchronous clear
                dout <= 16'h00;
            else if (load == 1'b1) // read/write control input
                dout <= din;
        end
endmodule
