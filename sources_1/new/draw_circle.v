`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2019 02:07:59 PM
// Design Name: 
// Module Name: draw_circle
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


module draw_circle(
    input [0:2][3:0] axis,
    input [0:2][3:0] bg,
    input [0:2][3:0] grid,
    input [0:2][3:0] tick,
    input clk_sample,
    input [3:0] lvl1,
    input [9:0] wave_sample,
    input switch,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid

    );

    //The Sample_Memory represents the memory array used to store the voice samples.
    //There are 1280 points and each point can range from 0 to 1023. 

    reg [9:0] Sample_Memory[1279:0];
    reg [10:0] i = 0;

    //Each wave_sample is displayed on the screen from left to right. 
    always @ (posedge clk_sample) begin
        i = (i==1279) ? 0 : i + 1;
        Sample_Memory[i] <= switch ? Sample_Memory[i] : wave_sample;              
    end

    wire Condition_For_Axis = (VGA_HORZ_COORD == 640 ) || (VGA_VERT_COORD == 512);
// The code below draws two grid lines. Modify the codes to draw more grid lines.
    wire Condition_For_Grid = (VGA_HORZ_COORD % 80 == 0) ||(VGA_VERT_COORD % 64 == 0) ;
// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    wire Condition_For_Ticks = ((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD < 646) && (VGA_HORZ_COORD > 634)) || ((VGA_HORZ_COORD % 16 == 0) && (VGA_VERT_COORD < 518) && (VGA_VERT_COORD > 506));

    wire circle1 = ( 2 *((VGA_HORZ_COORD - 640) * (VGA_HORZ_COORD - 640)) + (VGA_VERT_COORD - 512) * (VGA_VERT_COORD - 512)) <  2*10*20*(lvl1 + 1);  
    wire circle2 = ( 2 *((VGA_HORZ_COORD - 640) * (VGA_HORZ_COORD - 640)) + (VGA_VERT_COORD - 512) * (VGA_VERT_COORD - 512)) <  2*30*40*(lvl1 + 1);
    wire circle3 = ( 2 *((VGA_HORZ_COORD - 640) * (VGA_HORZ_COORD - 640)) + (VGA_VERT_COORD - 512) * (VGA_VERT_COORD - 512)) <  2*50*60*(lvl1 + 1);
    wire circle4 = ( 2 *((VGA_HORZ_COORD - 640) * (VGA_HORZ_COORD - 640)) + (VGA_VERT_COORD - 512) * (VGA_VERT_COORD - 512)) <  2*70*80*(lvl1 + 1);


    assign VGA_Red_Grid = Condition_For_Axis ? axis[0] : Condition_For_Grid? grid[0] : circle1? 4'hf : ((lvl1 >= 4) && (circle2))? 4'h0 : ((lvl1 >= 8) && (circle3))? 4'h0 : (lvl1 >= 12)&& (circle4)? 4'hc :0;
    assign VGA_Green_Grid = Condition_For_Axis ? axis[1] : Condition_For_Grid? grid[1] : circle1? 4'hf : ((lvl1 >= 4) && (circle2))? 4'h6 : ((lvl1 >= 8) && (circle3))? 4'h0 : (lvl1 >= 12) && (circle4)? 4'h0 :0;
    assign VGA_Blue_Grid = Condition_For_Axis ? axis[2] : Condition_For_Grid? grid[2] : circle1? 4'hf : ((lvl1 >= 4) && (circle2))? 4'h0 : ((lvl1 >= 8) && (circle3))? 4'h8 : (lvl1 >= 12) && (circle4)? 4'h0 :0;       
  
  endmodule
