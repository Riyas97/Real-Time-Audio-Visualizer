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


module line_graph2(
    input slower_clock,
    input [0:2][3:0] axis,
    input [0:2][3:0] bg,

    input [0:2][3:0] grid,

    input [0:2][3:0] tick,

    input clk_sample,
    input wave_cond,

    input switch,

    input [11:0] VGA_HORZ_COORD,

    input [11:0] VGA_VERT_COORD,
    input [3:0] level,

    output [3:0] VGA_Red_Grid,

    output [3:0] VGA_Green_Grid,

    output [3:0] VGA_Blue_Grid

    );

    wire Condition_For_Grid = (VGA_HORZ_COORD % 10 == 0);     

     assign VGA_Red_Grid = (Condition_For_Grid)? 4'h0 :wave_cond ? 4'hf : 0;
 //
     assign VGA_Green_Grid = (Condition_For_Grid)? 4'h0 :wave_cond ? 4'h0 :0;
 //
     assign VGA_Blue_Grid = (Condition_For_Grid)? 4'hf :wave_cond ? 4'h0 : 0;

endmodule