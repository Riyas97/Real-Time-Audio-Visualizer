`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 02:58:01 PM
// Design Name: 
// Module Name: display3
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


module display3( 
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
    reg [10:0] i = 1279;
    reg j = 0;
    reg k = 0;
    reg [9:0] sum = 0;
    reg [9:0] sum1 = 0;
    reg [9:0] mem [639:0];

    

    //Each wave_sample is displayed on the screen from left to right. 

   always @ (posedge clk_sample) begin
            j = ~j;
            if (j == 1) begin
             i = (i== 1279) ? 0 : i + 1;
            if (i < 640) begin
            mem[i] <= wave_sample;
            k = (i % 40 == 0)? 1 : 0;
            sum = (wave_sample > sum)? wave_sample : sum;
                            sum1 = (k == 1)? sum : sum1;
                     //       level = (j == 1)? sum1[9:6] : level;
                            sum <= (k == 1)? 0 :sum;
                            Sample_Memory[i] <= 1024 - sum1 + 100 - (3 * (sum1 - 512));
                   end
                   else if (i >= 640) begin
                 Sample_Memory[i] <= mem[i - 640];
                        end
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

      wire Condition_For_Grids = (VGA_HORZ_COORD % 40 == 0);
         
    assign VGA_Red_Grid =  ((VGA_HORZ_COORD < 640) && (VGA_HORZ_COORD % 40 == 0))? 4'h0 : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 350))? 4'he : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD >= 350) && (VGA_VERT_COORD < 550))? 4'hf : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD >= 550))? 4'h6 : ((VGA_HORZ_COORD >= 640) &&(VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])))? 0 :Condition_For_Axis ? axis[0] : Condition_For_Ticks ? tick[0] : Condition_For_Grid? grid[0] : color_select[11:8];
    assign VGA_Blue_Grid = ((VGA_HORZ_COORD < 640) && (VGA_HORZ_COORD % 40 == 0))? 4'h0 : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 350))? 4'h0 : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD >= 350) && (VGA_VERT_COORD < 550))? 4'hb : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD >= 550))? 4'hf :((VGA_HORZ_COORD >= 640) &&(VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])))? 0 :Condition_For_Axis ? axis[1] : Condition_For_Ticks ? tick[1] : Condition_For_Grid? grid[1] : color_select[11:8];
    assign VGA_Green_Grid = ((VGA_HORZ_COORD < 640) && (VGA_HORZ_COORD % 40 == 0))? 4'h0 : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 350))? 4'h0 : ((VGA_HORZ_COORD < 640) &&(VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD >= 350) && (VGA_VERT_COORD < 550))? 4'h7 : ((VGA_HORZ_COORD < 640) && (VGA_VERT_COORD >= Sample_Memory[VGA_HORZ_COORD]) && (VGA_VERT_COORD >= 550))? 4'h5 : ((VGA_HORZ_COORD >= 640) &&(VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])))? 0 :Condition_For_Axis ? axis[2] : Condition_For_Ticks ? tick[2] : Condition_For_Grid? grid[2] : color_select[11:8];
endmodule
