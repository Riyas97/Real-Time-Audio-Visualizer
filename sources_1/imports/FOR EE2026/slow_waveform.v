`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 03:08:25 PM
// Design Name: 
// Module Name: slow_waveform
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


module slow_waveform1(
  input [0:2][3:0] bg,

  input [0:2][3:0] waveform,

  input clk_sample, //20kHz clock

  input switch,

  input [9:0] wave_sample,

  input [11:0] VGA_HORZ_COORD,

  input [11:0] VGA_VERT_COORD,

  output [3:0] VGA_Red_waveform,

  output [3:0] VGA_Green_waveform,

  output [3:0] VGA_Blue_waveform

  );

  
reg [9:0] Sample_Memory[1279:0];
     reg [10:0] i = 0;
     reg j = 0;
     reg [9:0] sum;
     reg [9:0] sum1 = 0;
     reg [14:0] count = 0;
     
  
     //Each wave_sample is displayed on the screen from left to right. 
  
     always @(posedge clk_sample) begin
     
     count = (count == 1279)? 0: count + 1;
     j = (count % 80 == 0)? 1 : 0;
     sum = (wave_sample > sum)? wave_sample : sum;
             sum1 = (j == 1)? sum : sum1;
      //       level = (j == 1)? sum1[9:6] : level;
             sum <= (j == 1)? 0 :sum;
    end
    
    always @ (posedge clk_sample) begin
  
         i = ((j == 1) && (i==1279))? 0 : (j == 1)? i + 1 : i;
  
         Sample_Memory[i] <= switch ? Sample_Memory[i] : sum1;              
  
     end
 



  assign VGA_Red_waveform =   (((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[0] : 0);

  assign VGA_Green_waveform = (((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[1] : 0);

  assign VGA_Blue_waveform =  (((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[2] : 0);



  

 
   endmodule
