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


module display2(

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

    

    //The Sample_Memory represents the memory array used to store the voice samples.

    //There are 1280 points and each point can range from 0 to 1023. 

    reg [9:0] Sample_Memory[1279:0];

    reg [10:0] i = 639;
    reg j = 0;
    reg [1:0] count = 3;
    reg [9:0] sum [639:0];

    

    //Each wave_sample is displayed on the screen from left to right. 

   always @ (posedge clk_sample) begin
            j = ~j;
            if (j == 1) begin
            i = (i== 1279) ? 0 : i + 1;
           
            
        //   j = (j == 1279)? 640 : j + 1;     
                        sum[i] = (i <= 639)? wave_sample : sum[i];
                        Sample_Memory[i] <= switch ? Sample_Memory[i] : (i <= 639) ? wave_sample : sum[i - 640];  
                        end
                        
    end

    wire Condition_For_Axis = (VGA_HORZ_COORD == 960 ) || (VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD == 512);
// The code below draws two grid lines. Modify the codes to draw more grid lines.
    wire Condition_For_Grid = ((VGA_HORZ_COORD >= 640) && ((VGA_HORZ_COORD % 80 == 0) || (VGA_VERT_COORD % 64 == 0))) ;
// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    wire Condition_For_Ticks = (VGA_HORZ_COORD > 640) && (((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD < 966) && (VGA_HORZ_COORD > 954)) || ((VGA_HORZ_COORD % 16 == 0) && (VGA_VERT_COORD < 518) && (VGA_VERT_COORD > 506)));
    wire grids = (VGA_HORZ_COORD % 5 == 0);
    reg [11:0]color_select;

    always @ (posedge slower_clock) begin

        color_select = color_select;

    end

    

// Please modify below codes to change the background color and to display ticks defined above

    assign VGA_Red_Grid = ((VGA_HORZ_COORD < 1280) &&(VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])))? 0 :Condition_For_Axis ? axis[0] : Condition_For_Ticks ? tick[0] : Condition_For_Grid? grid[0] : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD > (1024 - Sample_Memory[VGA_HORZ_COORD])) && grids)? 4'hf : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD > (1024 - Sample_Memory[VGA_HORZ_COORD])))? 4'hD : color_select[11:8];

    assign VGA_Green_Grid = ((VGA_HORZ_COORD < 1280) &&(VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])))? 0 :Condition_For_Axis ? axis[1] : Condition_For_Ticks ? tick[1] : Condition_For_Grid? grid[1] : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD > (1024 - Sample_Memory[VGA_HORZ_COORD])) && grids)? 4'hf : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD > (1024 - Sample_Memory[VGA_HORZ_COORD])))? 4'hD : color_select[11:8];

    assign VGA_Blue_Grid = ((VGA_HORZ_COORD < 1280) &&(VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])))? 0 :Condition_For_Axis ? axis[2] : Condition_For_Ticks ? tick[2] : Condition_For_Grid? grid[2] : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD > (1024 - Sample_Memory[VGA_HORZ_COORD])) && grids)? 4'hf : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD > (1024 - Sample_Memory[VGA_HORZ_COORD])))? 4'hD : color_select[11:8];

     

endmodule
