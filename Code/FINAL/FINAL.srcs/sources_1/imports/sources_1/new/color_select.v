`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2019 08:11:33 PM
// Design Name: 
// Module Name: color_select
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


module color_select(
    input set, 
    input[2:0] switch, 
    input [0:11] color_set,
    input[1:0]main,
    input slow_clock, left, right, 
    output reg [0:11] bg,
    output reg [0:11] grid,
    output reg [0:11] waveform,
    output reg [0:11] tick, 
    output reg[0:11] axis);
    reg [3:0] counter = 0;
    
    reg [0:59] bg_set = {4'h0,4'h0,4'h0,4'h8,4'h8,4'ha,4'h5,4'h2,4'h2,4'h2,4'h5,4'h2,4'h8,4'h6,4'h1};
    reg [0:59] grid_set = {4'h0,4'h0,4'hf,4'h0,4'h0,4'h0,4'h0,4'h0,4'h0,4'hf,4'hf,4'hf,4'h0,4'h4,4'h1};
    reg [0:59] tick_set = {4'h0,4'hf,4'h0,4'hf,4'hb,4'h8,4'hd,4'h8,4'h0,4'h0,4'hf,4'h0,4'h9,4'hf,4'h9};
    reg [0:59] waveform_set = {4'hd,4'h0,4'hd,4'h0,4'hf,4'h0,4'h0,4'h0,4'he,4'hf,4'hf,4'hf,4'h4,4'h9,4'hf};
    reg [0:59] axis_set = {4'h0,4'hf,4'hf,4'hf,4'h0,4'h0,4'hf,4'hf,4'hf,4'h0,4'h0,4'hf,4'h5,4'ha,4'h5};
    always@ (posedge slow_clock) begin
        if(main == 0)begin
            if (left) begin
                counter <= (counter ==  4) ? 0 : counter + 1;
            end
            if (right)begin
                counter <= (counter == 0) ? 4 : counter - 1;
            end
        end
        if(set && main == 2)begin
            case(switch)
                0: bg_set[counter*12+:12] <= color_set;
                1: grid_set[counter*12+:12] <= color_set;
                2: waveform_set[counter*12+:12] <= color_set;
                3: axis_set[counter*12+:12] <= color_set;
                4: tick_set[counter*12+:12] <= color_set;
            endcase
        end
    end
    


    
    always @ (*) begin
        case(counter)
            0:begin
                bg <= bg_set[0:11];
                grid <= grid_set[0:11];
                tick <= tick_set[0:11];
                waveform <= waveform_set[0:11];
                axis <= axis_set[0:11];
            end
            1:begin
                bg <= bg_set[12:23];
                grid <= grid_set[12:23];
                tick <= tick_set[12:23];
                waveform <= waveform_set[12:23];
                axis <= axis_set[12:23];
            end
            2:begin
                bg <= bg_set[24:35];
                grid <= grid_set[24:35];
                tick <= tick_set[24:35];
                waveform <= waveform_set[24:35];
                axis <= axis_set[24:35];
            end
            3:begin
                bg <= bg_set[36:47];
                grid <= grid_set[36:47];
                tick <= tick_set[36:47];
                waveform <= waveform_set[36:47];
                axis <= axis_set[36:47];
            end
            4:begin
                bg <= bg_set[48:59];
                grid <= grid_set[48:59];
                tick <= tick_set[48:59];
                waveform <= waveform_set[48:59];
                axis <= axis_set[48:59];
            end
        endcase
    end
endmodule
