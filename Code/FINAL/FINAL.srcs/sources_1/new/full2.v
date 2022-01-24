`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2019 01:46:22 AM
// Design Name: 
// Module Name: full1
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


module full2(
input slower_clock,
    input [0:2][3:0] axis,
    input [0:2][3:0] bg,
    input [0:2][3:0] grid,
    input [0:2][3:0] tick,
    input clk_sample,
    input [9:0] wave_sample,
    input switch,
    input [3:0] lvl1,
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
        
            reg [11:0]color_select;
        
            always @ (posedge slower_clock) begin
        
                color_select = color_select;
        
            end
        
        wire circle1 = (VGA_HORZ_COORD < 640) && (VGA_VERT_COORD > 512) && ( 2 *((VGA_HORZ_COORD - 320) * (VGA_HORZ_COORD - 320)) + (VGA_VERT_COORD - 768) * (VGA_VERT_COORD - 768)) <  2*10*10*(lvl1 + 1);  
        wire circle2 = (VGA_HORZ_COORD < 640) && (VGA_VERT_COORD > 512) &&( 2 *((VGA_HORZ_COORD - 320) * (VGA_HORZ_COORD - 320)) + (VGA_VERT_COORD - 768) * (VGA_VERT_COORD - 768)) <  2*20*20*(lvl1 + 1);
        wire circle3 = (VGA_HORZ_COORD < 640) && (VGA_VERT_COORD > 512) &&( 2 *((VGA_HORZ_COORD - 320) * (VGA_HORZ_COORD - 320)) + (VGA_VERT_COORD - 768) * (VGA_VERT_COORD - 768)) <  2*30*30*(lvl1 + 1);
        // Please modify below codes to change the background color and to display ticks defined above
        
       assign VGA_Red_Grid = ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? 0 : ((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 0 : Condition_For_Axis ? axis[0] : Condition_For_Ticks ? tick[0] : axis1? 4'h6 : ((VGA_HORZ_COORD <= 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD <= 512) && colour)? 4'hf : ((VGA_HORZ_COORD < 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 512))? 4'h0 : circle1? 4'h0 : ((lvl1 >= 7) && (circle2))? 4'h0 : ((lvl1 >= 12) && (circle3))? 4'h5 : 0;
        
            assign VGA_Green_Grid = ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? 0 : ((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 0 : Condition_For_Axis ? axis[1] : Condition_For_Ticks ? tick[1] : axis1? 4'h6 : ((VGA_HORZ_COORD <= 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD <= 512) && colour)? 4'hf : ((VGA_HORZ_COORD < 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 512))? 4'h0 : circle1? 4'h5 : ((lvl1 >= 7) && (circle2))? 4'h0 : ((lvl1 >= 12) && (circle3))? 4'h0 : 0;
        
            assign VGA_Blue_Grid = ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? 0 : ((VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 0 : Condition_For_Axis ? axis[2] : Condition_For_Ticks ? tick[2] : axis1? 4'h6 : ((VGA_HORZ_COORD <= 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD <= 512) && colour)? 4'hf : ((VGA_HORZ_COORD < 639) && (VGA_VERT_COORD >= mem1[VGA_HORZ_COORD]) && (VGA_VERT_COORD < 512))? 4'ha : circle1? 4'h0 : ((lvl1 >= 7) && (circle2))? 4'h9 : ((lvl1 >= 12) && (circle3))? 4'h0 : 0;
endmodule

