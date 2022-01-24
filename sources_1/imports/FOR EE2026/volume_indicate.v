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


module volume_indicate(
    input menu_bg,color_box,
    input [1:0]SIDE_MENU_GRAPH,
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
    reg [10:0] i = 0;
    reg [9:0] sum = 0;
    reg [3:0] level = 0;
    reg [11:0] count = 0;
    //Each wave_sample is displayed on the screen from left to right. 
    always @ (posedge clk_sample) begin
        i = (i==1279) ? 0 : i + 1;
        Sample_Memory[i] <= switch ? Sample_Memory[i] : wave_sample;     
        count <= (count == 1999)? 0: count + 1;
               if(sum < wave_sample)
                   sum <= wave_sample;
           if(count == 1999) begin
           sum <= 0;
           level <= sum[7:4];
          end
          end

    wire Condition_For_Axis = (VGA_HORZ_COORD == 640 ) || (VGA_VERT_COORD == 512);
// The code below draws two grid lines. Modify the codes to draw more grid lines.
    wire Condition_For_Grid = (VGA_HORZ_COORD % 80 == 0) ||(VGA_VERT_COORD % 64 == 0) ;
// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    wire Condition_For_Ticks = ((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD < 646) && (VGA_HORZ_COORD > 634)) || ((VGA_HORZ_COORD % 16 == 0) && (VGA_VERT_COORD < 518) && (VGA_VERT_COORD > 506));

  
    wire condition1 = (VGA_HORZ_COORD >= 160) && (VGA_HORZ_COORD < 240) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
     wire condition2 = (VGA_HORZ_COORD >= 240) && (VGA_HORZ_COORD < 320) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
      wire condition3 = (VGA_HORZ_COORD >= 320) && (VGA_HORZ_COORD < 400) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
       wire condition4 = (VGA_HORZ_COORD >= 400) && (VGA_HORZ_COORD < 480) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
        wire condition5 = (VGA_HORZ_COORD >= 480) && (VGA_HORZ_COORD < 560) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
         wire condition6 = (VGA_HORZ_COORD >= 560) && (VGA_HORZ_COORD < 640) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
          wire condition7 = (VGA_HORZ_COORD >= 640) && (VGA_HORZ_COORD < 720) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
           wire condition8 = (VGA_HORZ_COORD >= 720) && (VGA_HORZ_COORD < 800) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
            wire condition9 = (VGA_HORZ_COORD >= 800) && (VGA_HORZ_COORD < 880) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
             wire condition10 = (VGA_HORZ_COORD >= 880) && (VGA_HORZ_COORD < 960) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
              wire condition11 = (VGA_HORZ_COORD >= 960) && (VGA_HORZ_COORD < 1040) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
               wire condition12 = (VGA_HORZ_COORD >= 1040) && (VGA_HORZ_COORD < 1120) && (VGA_VERT_COORD <= 200) && (VGA_VERT_COORD >= 100);
    

// Please modify below codes to change the background color and to display ticks defined above

    assign VGA_Red_Grid = (SIDE_MENU_GRAPH == 2 && color_box)|| (SIDE_MENU_GRAPH != 0 && menu_bg) ? 0 :((level >= 0) && (condition1))? 4'h0 : ((level >= 1) && (condition2))? 4'h0: ((level >= 2) && (condition3))? 4'h0 : ((level >= 3) && (condition4))? 4'h0 : ((level >= 4) && (condition5))? 4'h0: ((level >= 5) && (condition6))? 4'h0: ((level >= 6) && (condition7))? 4'h0: ((level >= 7) && (condition8))? 4'h0: ((level >= 8) && (condition9))? 4'h0: ((level >= 10) && (condition10))? 4'h9: ((level >= 12) && (condition11))? 4'h7: ((level >= 14) && (condition12))? 4'h5  : 0;

    assign VGA_Green_Grid = (SIDE_MENU_GRAPH == 2 && color_box)|| (SIDE_MENU_GRAPH != 0 && menu_bg) ? 0 :((level >= 0) && (condition1))? 4'hf : ((level >= 1) && (condition2))? 4'hc: ((level >= 2) && (condition3))? 4'h9 : ((level >= 3) && (condition4))? 4'h7 : ((level >= 4) && (condition5))? 4'h5: ((level >= 5) && (condition6))? 4'h0: ((level >= 6) && (condition7))? 4'h0: ((level >= 7) && (condition8))? 4'h0: ((level >= 8) && (condition9))? 4'h0: ((level >= 10) && (condition10))? 4'h0: ((level >= 12) && (condition11))? 4'h0: ((level >= 14) && (condition12))? 4'h0 : 0;

    assign VGA_Blue_Grid =(SIDE_MENU_GRAPH == 2 && color_box)|| (SIDE_MENU_GRAPH != 0 && menu_bg)  ? 0 : ((level >= 0) && (condition1))? 4'h0 : ((level >= 1) && (condition2))? 4'h0: ((level >= 2) && (condition3))? 4'h0 : ((level >= 3) && (condition4))? 4'h0 : ((level >= 4) && (condition5))? 4'h0: ((level >= 5) && (condition6))? 4'hc: ((level >= 6) && (condition7))? 4'h9: ((level >= 7) && (condition8))? 4'h7: ((level >= 8) && (condition9))? 4'h5: ((level >= 10) && (condition10))? 4'h0: ((level >= 12) && (condition11))? 4'h0: ((level >= 14) && (condition12))? 4'h0 : 0;

     

endmodule

