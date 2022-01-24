`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 01:37:27 PM
// Design Name: 
// Module Name: color_maker
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


module color_maker(
    input slow_clock,
    input menu_bg,
    input [11:0]VGA_HORZ_COORD,
    input [11:0]VGA_VERT_COORD,
    input left,right,
    input [1:0] selector,
    output [3:0] vga_red,
    output [3:0] vga_green,
    output [3:0] vga_blue,
    output color_box,
    output [0:11]input_color
    );
    reg [3:0] red = 0;
    reg [3:0] green = 0;
    reg [3:0] blue = 0;
    wire [4:0] menu_word;
    wire [2:0] number;
    assign input_color = {red,green,blue};
    always @ (posedge slow_clock)begin
        if(left)begin
            case(selector)
                0: red <= red - 1;
                1: green <= green - 1;
                2: blue <= blue - 1;
            endcase
        end
        if (right)begin
            case(selector)
                0: red <= red + 1;
                1: green <= green + 1;
                2: blue <= blue + 1;
            endcase
        end
    end
    string_map #(
        .font_size(2),
        .SIZE(5),
        .letters({6'd1,6'd36,6'd27,6'd14,6'd13})) 
        red_word(VGA_HORZ_COORD,VGA_VERT_COORD,80,64,menu_word[0]);
   string_map #(
        .font_size(2),
        .SIZE(7),
        .letters({6'd2,6'd36,6'd16,6'd27,6'd14,6'd14,6'd23})) 
        green_word(VGA_HORZ_COORD,VGA_VERT_COORD,80,94,menu_word[1]);
    string_map #(
        .font_size(2),
        .SIZE(6),
        .letters({6'd3,6'd36,6'd11,6'd21,6'd30,6'd14})) 
        blue_word(VGA_HORZ_COORD,VGA_VERT_COORD,80,124,menu_word[2]);
    string_map #(
        .font_size(2),
        .SIZE(6),
        .letters({6'd4,6'd36,6'd14,6'd33,6'd18,6'd29})) 
        exit(VGA_HORZ_COORD,VGA_VERT_COORD,80,154,menu_word[3]);
    bit_map #(.font_size(2),.pos_x(12'd208),.pos_y(12'd64)) r (VGA_HORZ_COORD,VGA_VERT_COORD,red,number[0]);
    bit_map #(.font_size(2),.pos_x(12'd208),.pos_y(12'd94)) g (VGA_HORZ_COORD,VGA_VERT_COORD,green,number[1]);
    bit_map #(.font_size(2),.pos_x(12'd208),.pos_y(12'd124)) b (VGA_HORZ_COORD,VGA_VERT_COORD,blue,number[2]);
    assign menu_word[4] = |number;
    assign color_box = (VGA_HORZ_COORD > 300) && (VGA_HORZ_COORD < 400) && (VGA_VERT_COORD > 50) && (VGA_VERT_COORD < 190);
    assign vga_red = menu_word[selector] ? 4'ha : |menu_word ? 4'h0: color_box ? red : menu_bg ? 4'h7 : 4'h0;
    assign vga_green = |menu_word ? 4'h0: color_box ? green : menu_bg ? 4'hc : 4'h0;
    assign vga_blue = |menu_word ? 4'h0: color_box ? blue : menu_bg ? 4'hf : 4'h0;
endmodule