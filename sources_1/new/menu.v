`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 03:19:24 PM
// Design Name: 
// Module Name: menu
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


module menu_graph(
    input [4:0]GRAPH_STATE,
    input left,right,
    input[1:0]toggle_menu,
    input[1:0] select_wave,
    input[1:0] select_color,
    input slow_clock,
    input [11:0]VGA_HORZ_COORD,
    input [11:0]VGA_VERT_COORD,
    output [3:0]red,
    output [3:0]green,
    output [3:0]blue,
    output menu_bg,
    output color_box,
    output [0:11]input_color
    );
    wire [3:0] red_comp;
    wire [3:0] green_comp;
    wire [3:0] blue_comp;
    wire [5:0] menu_word;
    assign menu_bg = (VGA_HORZ_COORD > 50) && (VGA_HORZ_COORD < 250) && (VGA_VERT_COORD > 50) && (VGA_VERT_COORD < 200);    
    string_map #(
        .font_size(1),
        .SIZE(11),
        .letters({6'd1,6'd36,6'd22,6'd10,6'd18,6'd23,6'd36,6'd22,6'd14,6'd23,6'd30})) 
        map1(VGA_HORZ_COORD,VGA_VERT_COORD,80,64,menu_word[0]);
    string_map #(
            .font_size(1),
            .SIZE(12),
            .letters({6'd2,6'd36,6'd12,6'd24,6'd21,6'd24,6'd30,6'd27,6'd36,6'd28,6'd14,6'd21})) 
            map2(VGA_HORZ_COORD,VGA_VERT_COORD,80,84,menu_word[1]);
    string_map #(
            .font_size(1),
            .SIZE(6),
            .letters({6'd3,6'd36,6'd14,6'd33,6'd18,6'd29})) 
            map3(VGA_HORZ_COORD,VGA_VERT_COORD,80,104,menu_word[2]);
    string_map #(
                .font_size(1),
                .SIZE(13),
                .letters({6'd12,6'd30,6'd27,6'd27,6'd14,6'd23,6'd29,6'd36,6'd16,6'd27,6'd10,6'd25,6'd17})) 
                map4(VGA_HORZ_COORD,VGA_VERT_COORD,80,124,menu_word[3]);
    wire [4:0] digit1 = (GRAPH_STATE + 1) / 10;
    wire [4:0] digit2 = (GRAPH_STATE + 1) % 10;
    bit_map #(.font_size(1),.pos_x(12'd192),.pos_y(12'd124)) n1 (VGA_HORZ_COORD,VGA_VERT_COORD,digit1,menu_word[4]);
    bit_map #(.font_size(1),.pos_x(12'd200),.pos_y(12'd124)) n2 (VGA_HORZ_COORD,VGA_VERT_COORD,digit2,menu_word[5]);
    color_maker x(slow_clock,menu_bg,VGA_HORZ_COORD,VGA_VERT_COORD,left,right,select_color,red_comp,green_comp,blue_comp,color_box,input_color);
    assign red = (toggle_menu == 2) ? red_comp : (toggle_menu == 1) ? menu_word[select_wave] ? 4'ha: (|menu_word ? 4'h0: menu_bg ? 4'h7 : 4'h0) : 4'h0;
    assign green = (toggle_menu==2) ? green_comp : (toggle_menu == 1) ? (|menu_word ? 4'h0:  menu_bg ? 4'hc : 4'h0) : 4'h0;
    assign blue = (toggle_menu == 2) ? blue_comp : (toggle_menu == 1) ? (|menu_word ? 4'h0:  menu_bg ? 4'hf : 4'h0) : 4'h0;
endmodule
