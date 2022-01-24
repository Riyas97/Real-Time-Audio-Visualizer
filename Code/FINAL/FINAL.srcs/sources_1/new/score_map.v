`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 01:29:33 PM
// Design Name: 
// Module Name: string_map
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


module score_map(
    input [11:0]VGA_HORZ_COORD,
    input [11:0]VGA_VERT_COORD,
    input [4:0]number1,
    input [4:0]number2,
    output condition_for_string
);
    wire [3:0]digit11;
    wire [3:0]digit12;
    wire [3:0]digit21;
    wire [3:0]digit22;
    assign digit11 = number1 / 10 ;
    assign digit12 = number1 % 10 ;
    assign digit21 = number2 / 10 ;
    assign digit22 = number2 % 10 ;
    parameter [11:0] pos_x = 372;
    parameter [11:0] pos_y = 100;
    parameter [11:0] pos_x2 = 780;
    parameter[4:0] font_size = 8;
    //font_map (0-9) 0-9 (A-Z) 10-35
    wire [7:0] letters1 = {digit12,digit11};
    wire [7:0] letters2 = {digit22,digit21};
    
    localparam [0:99][0:7] font_map = 
    {   //0
    8'b01111100,
    8'b11000110,
    8'b11000110,
    8'b11001110,
    8'b11011110,
    8'b11110110,
    8'b11100110,
    8'b11000110,
    8'b11000110,
    8'b01111100,
    //1
    8'b00011000,
    8'b00111000,
    8'b01111000,
    8'b00011000,
    8'b00011000,
    8'b00011000,
    8'b00011000,
    8'b00011000,
    8'b00011000,
    8'b01111110,
    //2
    8'b01111100,
    8'b11000110,
    8'b00000110,
    8'b00001100,
    8'b00011000,
    8'b00110000,
    8'b01100000,
    8'b11000000,
    8'b11000110,
    8'b11111110,
    //3
    8'b01111100,
    8'b11000110,
    8'b00000110,
    8'b00000110,
    8'b00111100,
    8'b00000110,
    8'b00000110,
    8'b00000110,
    8'b11000110,
    8'b01111100,
    //4
    8'b00001100,
    8'b00011100,
    8'b00111100,
    8'b01101100,
    8'b01101100,
    8'b11111110,
    8'b00001100,
    8'b00001100,
    8'b00001100,
    8'b00011110,
    //5
    8'b11111110,
    8'b11000000,
    8'b11000000,
    8'b11000000,
    8'b11111100,
    8'b00000110,
    8'b00000110,
    8'b00000110,
    8'b11000110,
    8'b01111100,
    //6
    8'b00111000,
    8'b01100000,
    8'b11000000,
    8'b11000000,
    8'b11111100,
    8'b11000110,
    8'b11000110,
    8'b11000110,
    8'b11000110,
    8'b01111100,
    //7
    8'b11111110,
    8'b11000110,
    8'b00000110,
    8'b00000110,
    8'b00001100,
    8'b00011000,
    8'b00110000,
    8'b00110000,
    8'b00110000,
    8'b00110000,
    //8
    8'b01111100,
    8'b11000110,
    8'b11000110,
    8'b11000110,
    8'b01111100,
    8'b11000110,
    8'b11000110,
    8'b11000110,
    8'b11000110,
    8'b01111100,
    //9
    8'b01111100,
    8'b11000110,
    8'b11000110,
    8'b11000110,
    8'b01111110,
    8'b00000110,
    8'b00000110,
    8'b00000110,
    8'b00001100,
    8'b01111000};

    wire [0:7] number_pos1 = font_map[letters1[(VGA_HORZ_COORD - pos_x)/(8*font_size)*4+:4]*10+(VGA_VERT_COORD-pos_y)/font_size];
    wire [0:7] number_pos2 = font_map[letters2[(VGA_HORZ_COORD - pos_x2)/(8*font_size)*4+:4]*10+(VGA_VERT_COORD-pos_y)/font_size];
    wire condition_for_string1 = (VGA_HORZ_COORD >= pos_x) &&  (VGA_HORZ_COORD < pos_x + (font_size*16)) && (VGA_VERT_COORD >= pos_y) && (VGA_VERT_COORD < pos_y + (font_size * 10)) && (number_pos1[((VGA_HORZ_COORD-pos_x)/font_size)%8]);
    wire condition_for_string2 = (VGA_HORZ_COORD >= pos_x2) &&  (VGA_HORZ_COORD < pos_x2 + (font_size*16)) && (VGA_VERT_COORD >= pos_y) && (VGA_VERT_COORD < pos_y + (font_size * 10)) && (number_pos2[((VGA_HORZ_COORD-pos_x2)/font_size)%8]);
    assign condition_for_string = condition_for_string1|condition_for_string2;
endmodule
