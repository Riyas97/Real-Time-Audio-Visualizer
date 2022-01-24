`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2019 02:25:09 PM
// Design Name: 
// Module Name: TestWave_Gen
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


module TestWave_Gen(input clk_20k,output reg[9:0] count = 0);
    always@ (posedge clk_20k)begin
        count <= (count == 639) ? 0 : count + 1;
    end
endmodule
