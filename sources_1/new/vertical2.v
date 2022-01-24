`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------  
//                  DRAWING GRID LINES AND TICKS ON SCREEN
// Description:
// Grid lines are drawn at pixel # 320 along the x-axis, and
// pixel #768 along the y-axis

// Note the VGA controller is configured to produce a 1024 x 1280 pixel resolution
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// TOOD:    Draw grid lines at every 80-th pixel along the horizontal axis, and every 64th pixel
//          along the vertical axis. This gives us a 16x16 grid on screen. 
//          
//          Further draw ticks on the central x and y grid lines spaced 16 and 8 pixels apart in the 
//          horizontal and vertical directions respectively. This gives us 5 sub-divisions per division 
//          in the horizontal and 8 sub-divisions per divsion in the vertical direction   
//-------------------------------------------------------------------------  
  
//////////////////////////////////////////////////////////////////////////////////


module vert_zoom1b(
    input wave_cond,

    input slower_clock,

    input [0:2][3:0] axis,

    input [0:2][3:0] bg,

    input [0:2][3:0] grid,

    input [0:2][3:0] tick,

    input clk_sample,

    input [9:0] wave_sample,

    input switch,

    input [11:0] VGA_HORZ_COORD,

    input [11:0] VGA_VERT_COORD,

    output [3:0] VGA_Red_Grid,

    output [3:0] VGA_Green_Grid,

    output [3:0] VGA_Blue_Grid

    );


    wire Condition_For_Axis = (VGA_HORZ_COORD == 640 ) || (VGA_VERT_COORD == 512);

// The code below draws two grid lines. Modify the codes to draw more grid lines.

    wire Condition_For_Grid = (VGA_HORZ_COORD % 160 == 0) ||(VGA_VERT_COORD % 128 == 0) ;

// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.

    wire Condition_For_Ticks = ((VGA_VERT_COORD % 32 == 0) && (VGA_HORZ_COORD < 652) && (VGA_HORZ_COORD > 628)) || ((VGA_HORZ_COORD % 32 == 0) && (VGA_VERT_COORD < 526) && (VGA_VERT_COORD > 500));

    

// Please modify below codes to change the background color and to display ticks defined above

    assign VGA_Red_Grid = (wave_cond)? 0 :Condition_For_Axis ? axis[0] : Condition_For_Ticks ? tick[0] : Condition_For_Grid? grid[0] :0;
    assign VGA_Green_Grid = (wave_cond)? 0 :Condition_For_Axis ? axis[1] : Condition_For_Ticks ? tick[1] : Condition_For_Grid? grid[1] :0;
    assign VGA_Blue_Grid = (wave_cond)? 0 :Condition_For_Axis ? axis[2] : Condition_For_Ticks ? tick[2] : Condition_For_Grid? grid[2] :0;

     

endmodule
