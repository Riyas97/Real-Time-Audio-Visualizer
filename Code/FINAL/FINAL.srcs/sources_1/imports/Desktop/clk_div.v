`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2019 01:42:14 PM
// Design Name: 
// Module Name: clk_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div(input CLK, output reg clk_20k = 0, output slow_clock, output slower_clock);
    reg[11:0]count1 = 0;
    reg[23:0]count2 = 0;
    reg[18:0]count3 = 0;
    assign slower_clock = count2[23];
    assign slow_clock = count3[18];
    always @ (posedge CLK) begin
        if(count1 == 2500) begin
            clk_20k = clk_20k + 1;
            count1 = 0;
        end
        count1 = count1 + 1;
        count2 = count2 + 1;
        count3 = count3 + 1;
    end
endmodule