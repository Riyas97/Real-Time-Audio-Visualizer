`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// You may study and modify the code inside this module to imporve the display feature or introduce other features
//////////////////////////////////////////////////////////////////////////////////

module full3(

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

    reg [9:0] mem1[1279:0];
    reg [9:0] mem2 [1279:0];
    reg [9:0] store1[639:0];
    reg [9:0] store2[639:0];
    reg j = 0;
    reg [10:0] i = 1279;
    
    

    //Each wave_sample is displayed on the screen from left to right. 

    always @ (posedge clk_sample) begin
        j = ~j;
        //if (j == 1) begin
        i = (i==1279) ? 0 : i + 1;
        if (i < 640) begin
       // Sample_Memory[i] <= switch ? Sample_Memory[i] : wave_sample + 256;
//        mem2[i] <= switch ? mem[i] : wave_sample - 256;
        store1[i] <= switch ? store1[i] : (1024 - wave_sample) / 2;
        store2[i] <= switch ? store2[i] :  1024 - (wave_sample / 2);
        end
        else if (i >= 640) begin               
        mem1[i] = store1[i - 640];
        mem2[i] = store2[i - 640];
    end

     end
     //end
wire colour2 = (VGA_HORZ_COORD % 3 == 0);


    assign VGA_Red_waveform =   ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? waveform[0] : ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]) && colour2)? 4'h4 : ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 4'h0 : 0;

    assign VGA_Green_waveform =  ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? waveform[1] : ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]) && colour2)? 4'h0 : ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD])) ? 4'h9 :0;

    assign VGA_Blue_waveform =  ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD == mem1[VGA_HORZ_COORD])) ? waveform[2] : ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]) && colour2)? 4'h4 : ((VGA_HORZ_COORD > 640) && (VGA_VERT_COORD >= mem2[VGA_HORZ_COORD]))? 4'h2 :0;


endmodule