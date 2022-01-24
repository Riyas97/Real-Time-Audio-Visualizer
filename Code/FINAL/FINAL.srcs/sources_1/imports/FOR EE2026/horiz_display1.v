
module horiz_display1(

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
    reg [9:0] mem [1279:0];

    reg [10:0] i = 0;

    

    //Each wave_sample is displayed on the screen from left to right. 

    always @ (posedge clk_sample) begin

        i = (i==1279) ? 0 : i + 1;

        Sample_Memory[i] <= switch ? Sample_Memory[i] : wave_sample + 256;
        mem[i] <= switch ? mem[i] : wave_sample - 256;               

    end

     



        assign VGA_Red_waveform = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[0] : ( (VGA_HORZ_COORD < 1280) && ((VGA_VERT_COORD >= (1024 - mem[VGA_HORZ_COORD]))) && ~(VGA_VERT_COORD < 512))? 4'h4 : 0;

    assign VGA_Green_waveform = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[1] : ( ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD >= (1024 - mem[VGA_HORZ_COORD]))) && ~(VGA_VERT_COORD < 512)) ? 4'h4 : 0;

    assign VGA_Blue_waveform =  ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? waveform[2] : ( ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD >= (1024 - mem[VGA_HORZ_COORD]))) && ~(VGA_VERT_COORD < 512)) ? 4'h4 : 0;



    

endmodule
