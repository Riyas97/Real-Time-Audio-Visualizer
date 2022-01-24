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


module Draw_Background(
    input [3:0] off,
    input [1:0]SIDE_MENU_GRAPH,
    input menu_bg,color_box,
    input wave_cond,
    input [0:11] axis,
    input [0:11] bg,
    input [0:11] grid,
    input [0:11] tick,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );
    wire Condition_For_Axis = (VGA_HORZ_COORD == 639) ||(VGA_HORZ_COORD == 641) || (VGA_HORZ_COORD == 640) || (VGA_VERT_COORD == 512) || (VGA_VERT_COORD == 511) || (VGA_VERT_COORD == 513);
// The code below draws two grid lines. Modify the codes to draw more grid lines.
    wire Condition_For_Grid = (VGA_HORZ_COORD % 80 == 0) ||(VGA_VERT_COORD % 64 == 0) ;
// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    wire Condition_For_Ticks = ((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD < 646) && (VGA_HORZ_COORD > 634)) || (((VGA_HORZ_COORD % 16 == 0) && (VGA_VERT_COORD < 518) && (VGA_VERT_COORD > 506)));
   // Please modify below codes to change the background color and to display ticks defined above
    assign VGA_Red_Grid = (SIDE_MENU_GRAPH == 2 && color_box)|| (SIDE_MENU_GRAPH != 0 && menu_bg) || (wave_cond && ~off[3]) ? 0 :Condition_For_Axis && ~off[0] ? axis[0:3] : Condition_For_Ticks && ~off[1] ? tick[0:3] : (Condition_For_Grid && ~off[2]) ? grid[0:3] :bg[0:3];
    assign VGA_Green_Grid = (SIDE_MENU_GRAPH == 2 && color_box)|| (SIDE_MENU_GRAPH != 0 && menu_bg) || (wave_cond && ~off[3]) ? 0 :Condition_For_Axis && ~off[0] ? axis[4:7] : Condition_For_Ticks && ~off[1] ? tick[4:7] : (Condition_For_Grid && ~off[2])? grid[4:7] :bg[4:7];
    assign VGA_Blue_Grid = (SIDE_MENU_GRAPH == 2 && color_box)|| (SIDE_MENU_GRAPH != 0 && menu_bg) || (wave_cond && ~off[3]) ? 0 :Condition_For_Axis && ~off[0] ? axis[8:11] : Condition_For_Ticks && ~off[1] ? tick[8:11] : (Condition_For_Grid && ~off[2])? grid[8:11] :bg[8:11];

endmodule
