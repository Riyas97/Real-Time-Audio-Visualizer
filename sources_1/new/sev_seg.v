`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2019 12:55:22 PM
// Design Name: 
// Module Name: sev_seg
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


module sev_seg(
    input [3:0] level,
    input clk,
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    parameter zero = 7'b1000000;
    parameter one = 7'b1111001;
    parameter two = 7'b0100100;
    parameter three = 7'b0110000;
    parameter four = 7'b0011001;
    parameter five = 7'b0010010;
    parameter six = 7'b0000010;
    parameter seven = 7'b1111000;
    parameter eight =  7'b0000000;
    parameter nine = 7'b0011000;
    
    
    reg [1:0] count;
    always @(posedge clk)begin
    count <= ~count;
    an <= (count)? 4'b1101 : 4'b1110;
    
    case(level)
    0: seg <= (count)? 7'b1000000 : 7'b1000000; 
    1: seg <= (count)? 7'b1000000 : one;
    2: seg <= (count)? 7'b1000000 : two;
    3: seg <= (count)? 7'b1000000 : three;
    4: seg <= (count)? 7'b1000000 : four;
    5: seg <= (count)? 7'b1000000 : five;
    6: seg <= (count)? 7'b1000000 : 7'b0000010;
    7: seg <= (count)? 7'b1000000 : 7'b1111000;
    8: seg <= (count)? 7'b1000000 : 7'b0000000;
    9: seg <= (count)? 7'b1000000 : 7'b0011000;
    10: seg <= (count)? one : 7'b1000000;
    11: seg <= (count)? one : 7'b1000000;
    12: seg <= (count)? one : one;
    13: seg <= (count)? one : one;
    14: seg <= (count)? one : two;
    15: seg <= (count)? one : two;
    endcase
    end
endmodule
