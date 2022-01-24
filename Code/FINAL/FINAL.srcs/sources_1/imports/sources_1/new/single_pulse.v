`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2019 08:09:39 PM
// Design Name: 
// Module Name: single_pulse
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

module single_pulse(
    input CLOCK, button,
    output pulse
    );
    wire qd;
    wire q;
    my_dff a (CLOCK,button,qd);
    my_dff b (CLOCK,qd,q);
    assign pulse = qd & ~q;
endmodule