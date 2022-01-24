`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 05:04:36 PM
// Design Name: 
// Module Name: full2
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


module full4(
input slower_clock,
    input [0:2][3:0] axis,
    input [0:2][3:0] bg,
    input [0:2][3:0] grid,
    input [0:2][3:0] tick,
    input clk_sample,
    input [9:0] wave_sample,
    input switch,
    input [3:0] level,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid

    );

    

    //The Sample_Memory represents the memory array used to store the voice samples.

    //There are 1280 points and each point can range from 0 to 1023. 
    
     reg [9:0] mem1[1279:0];
     reg [9:0] mem2 [1279:0];
     reg [9:0] store1[639:0];
     reg [9:0] store2[639:0];
     reg j = 0;
     reg [10:0] i = 1279;
     reg [10:0] count = 1279;
     reg [11:0]colour_select;
     reg [9:0] sum = 0;
     reg [9:0] sum1 = 0;
     reg [3:0] lvl = 0;
  //   reg [3:0] lvl1 = 0;
     reg [3:0] k = 0;
     
    always @(posedge clk_sample) begin
 
        count = (count == 1279)? 0: count + 1;
        k = ((count == 1279) && (k <= 2))? k + 1 : k;
        j = (count % 40 == 0)? 1 : 0;
        sum = (wave_sample > sum)? wave_sample : sum;
        sum1 = (j == 1)? sum : sum1;
        sum <= (j == 1)? 0 :sum;
    //    lvl = ((j == 1) && (sum[8:5] > lvl))? sum1[8:5] : lvl;
     //   lvl1 = (k == 3)? lvl: lvl1;
      //  lvl <= (k == 3)? 0 : lvl; 
        k = (k == 3)? 0 : k;
   end
   
    
   always @ (posedge clk_sample) begin 
          
    i = (i==1279) ? 0 : i + 1;
    if (i < 640) begin
         // Sample_Memory[i] <= switch ? Sample_Memory[i] : wave_sample + 256;
          mem1[i] <= switch? mem1[i] : ((1024 - sum1)/ 3) + ((1024 - sum1)/ 3) - 20;
          store1[i] <= switch ? store1[i] : (1024 - wave_sample) / 2;
          store2[i] <= switch ? store2[i] : 1024 - (wave_sample / 2);
          end
          else if (i >= 640) begin               
          mem1[i] = store1[i - 640];
          mem2[i] = store2[i - 640];
      end  
       end

       
         wire colour = (VGA_HORZ_COORD % 40 == 0); // for rectangle
         wire Condition_For_Axis = (VGA_HORZ_COORD == 640 ) || (VGA_VERT_COORD == 512);
         wire axis1 = ((VGA_HORZ_COORD == 960) && (VGA_VERT_COORD <= 512)) || ((VGA_VERT_COORD == 256) && (VGA_HORZ_COORD >= 640)); 
         wire Condition_For_Grid = ((VGA_VERT_COORD <= 512) && (VGA_HORZ_COORD % 80 == 0) && (VGA_HORZ_COORD >= 640)) ||((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD % 64 == 0) && (VGA_VERT_COORD <= 512)) ;
         wire Condition_For_Ticks = ( (VGA_VERT_COORD <= 512) && (VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD < 966) && (VGA_HORZ_COORD > 952)) || ((VGA_HORZ_COORD >= 640) && (VGA_HORZ_COORD % 16 == 0) && (VGA_VERT_COORD < 262) && (VGA_VERT_COORD > 250));
          // line
        
        wire condition1 = (VGA_HORZ_COORD >= 80) && (VGA_HORZ_COORD < 120) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition2 = (VGA_HORZ_COORD >= 120) && (VGA_HORZ_COORD < 160) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition3 = (VGA_HORZ_COORD >= 160) && (VGA_HORZ_COORD < 200) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition4 = (VGA_HORZ_COORD >= 200) && (VGA_HORZ_COORD < 240) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition5 = (VGA_HORZ_COORD >= 240) && (VGA_HORZ_COORD < 280) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition6 = (VGA_HORZ_COORD >= 280) && (VGA_HORZ_COORD < 320) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition7 = (VGA_HORZ_COORD >= 320) && (VGA_HORZ_COORD < 360) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition8 = (VGA_HORZ_COORD >= 360) && (VGA_HORZ_COORD < 400) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition9 = (VGA_HORZ_COORD >= 400) && (VGA_HORZ_COORD < 440) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition10 = (VGA_HORZ_COORD >= 440) && (VGA_HORZ_COORD < 480) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition11 = (VGA_HORZ_COORD >= 480) && (VGA_HORZ_COORD < 520) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
        wire condition12 = (VGA_HORZ_COORD >= 520) && (VGA_HORZ_COORD < 560) && (VGA_VERT_COORD <= 896) && (VGA_VERT_COORD >= 640);
             
        
       assign VGA_Red_Grid = ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? 0 : ((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 0 : Condition_For_Axis ? axis[0] : Condition_For_Ticks ? tick[0] : axis1? 4'h6 : ((VGA_HORZ_COORD <= 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD <= 512) && colour)? 4'hf : ((VGA_HORZ_COORD < 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 512))? 4'h0 : ((level >= 0) && (condition1))? 4'h0 : ((level >= 1) && (condition2))? 4'h0: ((level >= 2) && (condition3))? 4'h0 : ((level >= 3) && (condition4))? 4'h0 : ((level >= 4) && (condition5))? 4'h0: ((level >= 5) && (condition6))? 4'h0: ((level >= 6) && (condition7))? 4'h0: ((level >= 7) && (condition8))? 4'h0: ((level >= 8) && (condition9))? 4'h0: ((level >= 10) && (condition10))? 4'h4: ((level >= 12) && (condition11))? 4'h8: ((level >= 14) && (condition12))? 4'hc : 0;

            assign VGA_Green_Grid = ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? 0 : ((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 0 : Condition_For_Axis ? axis[1] : Condition_For_Ticks ? tick[1] : axis1? 4'h6 : ((VGA_HORZ_COORD <= 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD <= 512) && colour)? 4'hf : ((VGA_HORZ_COORD < 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 512))? 4'h0 :  ((level >= 0) && (condition1))? 4'h3 : ((level >= 1) && (condition2))? 4'h4: ((level >= 2) && (condition3))? 4'h5 : ((level >= 3) && (condition4))? 4'h6 : ((level >= 4) && (condition5))? 4'h8: ((level >= 5) && (condition6))? 4'h0: ((level >= 6) && (condition7))? 4'h0: ((level >= 7) && (condition8))? 4'h0: ((level >= 8) && (condition9))? 4'h0: ((level >= 10) && (condition10))? 4'h0: ((level >= 12) && (condition11))? 4'h0: ((level >= 14) && (condition12))? 4'h0 : 0;
        
            assign VGA_Blue_Grid = ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? 0 : ((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 0 : Condition_For_Axis ? axis[2] : Condition_For_Ticks ? tick[2] : axis1? 4'h6 : ((VGA_HORZ_COORD <= 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD <= 512) && colour)? 4'hf : ((VGA_HORZ_COORD < 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 512))? 4'ha : ((level >= 0) && (condition1))? 4'h0 : ((level >= 1) && (condition2))? 4'h0: ((level >= 2) && (condition3))? 4'h0 : ((level >= 3) && (condition4))? 4'h0 : ((level >= 4) && (condition5))? 4'h0: ((level >= 5) && (condition6))? 4'h3: ((level >= 6) && (condition7))? 4'h5: ((level >= 7) && (condition8))? 4'h7: ((level >= 8) && (condition9))? 4'h9: ((level >= 10) && (condition10))? 4'h0: ((level >= 12) && (condition11))? 4'h0: ((level >= 14) && (condition12))? 4'h0 : 0;

        
             
        
        endmodule