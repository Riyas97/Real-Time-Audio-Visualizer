`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 07:56:07 PM
// Design Name: 
// Module Name: menu_pong
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


module menu_pong(
    input menu_bg,
    input toggle_menu,
    input select_wave,
    input [11:0]VGA_HORZ_COORD,
    input [11:0]VGA_VERT_COORD,
    output [3:0]red,
    output [3:0]green,
    output [3:0]blue);
    wire [1:0] menu_word;
    string_map #(
        .font_size(1),
        .SIZE(11),
        .letters({6'd1,6'd36,6'd22,6'd10,6'd18,6'd23,6'd36,6'd22,6'd14,6'd23,6'd30})) 
        map1(VGA_HORZ_COORD,VGA_VERT_COORD,80,64,menu_word[0]);
    string_map #(
        .font_size(1),
        .SIZE(6),
        .letters({6'd2,6'd36,6'd14,6'd33,6'd18,6'd29})) 
        map2(VGA_HORZ_COORD,VGA_VERT_COORD,80,84,menu_word[1]);
    assign red = toggle_menu ? menu_word[select_wave] ? 4'ha: (|menu_word ? 4'h0: menu_bg ? 4'h7 : 4'h0) : 4'h0;
    assign green = toggle_menu ? (|menu_word ? 4'h0:  menu_bg ? 4'hc : 4'h0) : 4'h0;
    assign blue = toggle_menu ? (|menu_word ? 4'h0:  menu_bg ? 4'hf : 4'h0) : 4'h0;
endmodule
