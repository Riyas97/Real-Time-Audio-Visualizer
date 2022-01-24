`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// You may study and modify the code inside this module to imporve the display feature or introduce other features
//////////////////////////////////////////////////////////////////////////////////

module Draw_Waveform(
    input off,
    input zoom,
    input [0:11] waveform,
    input clk_sample, //20kHz clock
    input switch,
    input [9:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_waveform,
    output [3:0] VGA_Green_waveform,
    output [3:0] VGA_Blue_waveform,
    output wave_cond1,
    output wave_cond2
    );
    
    //The Sample_Memory represents the memory array used to store the voice samples.
    //There are 1280 points and each point can range from 0 to 1023. 
    reg [9:0] Sample_Memory[1279:0];
    reg [10:0] i = 0;
    
    //Each wave_sample is displayed on the screen from left to right. 
    always @ (posedge clk_sample) begin
        i = (i==1279) ? 0 : i + 1;
        Sample_Memory[i] <= switch ? Sample_Memory[i] : zoom ? wave_sample + (2 * (wave_sample - 512)) : wave_sample;               
    end
    wire [9:0] faster = (1024 - Sample_Memory[VGA_HORZ_COORD]);
    wire wave_cond = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD > faster - 3) && (VGA_VERT_COORD < faster + 3));
    assign wave_cond1 = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD])));
    assign wave_cond2 = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD < 1024 && VGA_VERT_COORD >= (1024 - Sample_Memory[VGA_HORZ_COORD])));
    assign VGA_Red_waveform = wave_cond && ~off ? waveform[0:3] : 0;
    assign VGA_Green_waveform = wave_cond && ~off ? waveform[4:7]: 0;
    assign VGA_Blue_waveform =  wave_cond && ~off ? waveform[8:11]: 0;

    
endmodule
