`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 05:33:49 PM
// Design Name: 
// Module Name: Introduction
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


module introduction(
    input select,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );
    
    wire [4:0]condition;
    string_map #(
        .font_size(4),
        .SIZE(17),
        .letters({6'd32,6'd14,6'd21,6'd12,6'd24,6'd22,6'd14,6'd36,6'd29,6'd24,6'd36,6'd14,6'd14,6'd2,6'd0,6'd2,6'd6})) 
        map1(VGA_HORZ_COORD,VGA_VERT_COORD,368,100,condition[0]);
    string_map #(
        .font_size(4),
        .SIZE(26),
        .letters({6'd27,6'd14,6'd10,6'd21,6'd36,6'd29,6'd18,6'd22,6'd14,6'd36,6'd10,6'd30,6'd13,6'd18,6'd24,6'd36,6'd31,6'd18,6'd28,6'd30,6'd10,6'd21,6'd18,6'd35,6'd14,6'd27})) 
        map2(VGA_HORZ_COORD,VGA_VERT_COORD,224,200,condition[1]);
    string_map #(
        .font_size(4),
        .SIZE(8),
        .letters({6'd1,6'd36,6'd16,6'd27,6'd10,6'd25,6'd17,6'd28})) 
        map3(VGA_HORZ_COORD,VGA_VERT_COORD,512,500,condition[2]);
    string_map #(
        .font_size(4),
        .SIZE(6),
        .letters({6'd2,6'd36,6'd25,6'd24,6'd23,6'd16})) 
        map4(VGA_HORZ_COORD,VGA_VERT_COORD,512,600,condition[3]);
    string_map #(
        .font_size(2),
        .SIZE(28),
        .letters({6'd13,6'd24,6'd23,6'd14,6'd36,6'd11,6'd34,6'd36,6'd12,6'd17,6'd18,6'd23,6'd36,6'd20,6'd17,6'd10,6'd23,6'd16,6'd36,6'd10,6'd23,6'd13,6'd36,6'd27,6'd18,6'd34,6'd10,6'd28})) 
        map5(VGA_HORZ_COORD,VGA_VERT_COORD,25,1000,condition[4]);
    assign VGA_Red_Grid = |condition ? 4'hF: 4'h1 ;
    assign VGA_Green_Grid = |condition ? 4'hF: 4'h3 ;
    assign VGA_Blue_Grid = condition[3]? (select?4'h0:4'hF): condition[2] ? (select?4'hF:4'h0) :((|condition[1:0]) || condition[4] ? 4'hF: 4'h6);
endmodule
