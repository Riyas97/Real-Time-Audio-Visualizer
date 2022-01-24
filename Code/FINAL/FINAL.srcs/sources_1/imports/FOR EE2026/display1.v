`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 09:44:18 PM
// Design Name: 
// Module Name: display1
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


module display1(

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

    

    //The Sample_Memory represents the memory array used to store the voice samples.

    //There are 1280 points and each point can range from 0 to 1023. 

    reg [9:0] Sample_Memory[1279:0];
    reg [9:0] sum [639:0];

    reg [10:0] i = 639;
reg  j = 0;
reg [1:0] count = 3;


    

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


     



    assign VGA_Red_waveform =   (((VGA_HORZ_COORD < 1280) && (VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[0] : 0);

    assign VGA_Green_waveform = (((VGA_HORZ_COORD < 1280) && (VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[1] : 0);

    assign VGA_Blue_waveform =  (((VGA_HORZ_COORD < 1280) && (VGA_HORZ_COORD >= 640) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[2] : 0);



    

endmodule
