`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 06:07:16 PM
// Design Name: 
// Module Name: Draw_Pong
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


module Draw_Pong(
    input SIDE_MENU_PONG,
    input menu_bg,
    input [1:0]STATE,
    input [3:0] lvl,
    input game_clock,
    input sw0,
    input sw1,
    input sw2,
    input sw3,
    input sw4,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Pong,
    output [3:0] VGA_Green_Pong,
    output [3:0] VGA_Blue_Pong
    );
    wire cond;
    assign cond = SIDE_MENU_PONG && menu_bg;
    reg[2:0] win;
    reg[11:0] x = 250;
    reg[11:0] y = 250;
    reg[11:0] x_ball = 640;
    reg[11:0] y_ball = 512;
    reg lose = 0;
    reg toggle_x = 0;
    reg toggle_y = 0;
    reg[4:0] number1 = 0;
    reg[4:0] number2 = 0;
    reg toggled = 1;
    wire[7:0] x_ball_size = 10 + 10 * lvl;
    wire[7:0] y_ball_size = 12 + 12 * lvl;

    always @ (posedge game_clock) begin
        if(STATE == 2 && win == 0)begin
            if(toggled)begin
                toggled = 0;
                x = 250;
                y = 250;
                x_ball = 640;
                y_ball = 512;
                lose = 0;
                toggle_x = 0;
                toggle_y = 0;
                number1 = 0;
                number2 = 0;
            end
            if (number1 == 30)begin
                win = 1;
            end
            if (number2 == 30)begin
                win = 2;
            end
            if (~sw2 )begin
                toggled = 1;
            end
            if(~(STATE == 2))begin
                toggled = 1;
            end
            if (~sw3) begin
                x = sw0 ? ((x > 774) ? x :  x + 2) : ((x < 2) ? x :  x - 2);
            end else begin
                if (x + 125 < y_ball && x_ball < 640)x = ((x > 774) ? x :  x + 1);
                if (x + 125 > y_ball && x_ball < 640)x = ((x < 2) ? x :  x - 1);
            end
            if(~sw4)begin
                y = sw1 ? ((y > 774) ? y :  y + 2) : ((y < 2) ? y :  y - 2);
            end else begin
                if (y + 125 < y_ball&& x_ball > 640)y = ((y > 774) ? y :  y + 1);
                if (y + 125 > y_ball&& x_ball > 640)y = ((y < 2) ? y :  y - 1);
            end
            if (lose) begin
                lose = 0;
                x_ball = 640;
                y_ball = 512;
            end
            if(toggle_x)begin
                x_ball <= x_ball+2;
                toggle_x <= (x_ball + x_ball_size >  (1180) && (y_ball + y_ball_size > y) && (y_ball - y_ball_size < y + 250)) ? toggle_x + 1 : toggle_x;
                if(x_ball + x_ball_size > 1190)begin
                    lose = 1;
                    number1 = number1 + 1;
                end
            end else begin
                x_ball <= x_ball-2;
                toggle_x <= (x_ball - x_ball_size < (100) && (y_ball + y_ball_size > x) && (y_ball - y_ball_size < x + 250)) ? toggle_x + 1 : toggle_x;
                if(x_ball - x_ball_size < 90)begin
                    lose = 1;
                    number2 = number2 + 1;
                end
            end
            if(toggle_y)begin
                y_ball <= y_ball+2;
                toggle_y <= (y_ball + y_ball_size >  1023) ? toggle_y + 1 : toggle_y;
            end else begin
                y_ball <= y_ball-2;
                toggle_y <= (y_ball - y_ball_size < 1) ? toggle_y + 1 : toggle_y;
            end
        end else begin
            win <= sw2 ? win : 0;
        end
    end
    wire [2:0]condition;
    string_map #(
        .font_size(4),
        .SIZE(13),
        .letters({6'd25,6'd21,6'd10,6'd34,6'd14,6'd27,6'd36,6'd1,6'd36,6'd32,6'd18,6'd23,6'd28})) 
        map1(VGA_HORZ_COORD,VGA_VERT_COORD,432,100,condition[0]);
    string_map #(
        .font_size(4),
        .SIZE(13),
        .letters({6'd25,6'd21,6'd10,6'd34,6'd14,6'd27,6'd36,6'd2,6'd36,6'd32,6'd18,6'd23,6'd28})) 
        map2(VGA_HORZ_COORD,VGA_VERT_COORD,432,100,condition[1]);
// The code below draws two grid lines. Modify the codes to draw more grid lines. 
    wire left = (VGA_HORZ_COORD > 50 && VGA_HORZ_COORD < 100) &&  (VGA_VERT_COORD > x && VGA_VERT_COORD < x + 250) ;
    wire center_line = (VGA_HORZ_COORD == 640);
// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    wire right = (VGA_HORZ_COORD > 1180 && VGA_HORZ_COORD < 1230) &&  (VGA_VERT_COORD > y && VGA_VERT_COORD < y + 250);
    wire ball = (VGA_HORZ_COORD > x_ball-x_ball_size && VGA_HORZ_COORD < x_ball + x_ball_size) && (VGA_VERT_COORD > y_ball-y_ball_size && VGA_VERT_COORD < y_ball + y_ball_size);
    wire score;
    //bitmap #(.font_size(8)) a(VGA_HORZ_COORD,VGA_VERT_COORD,200,200,digit11,s11);
    //bitmap #(.font_size(8)) b(VGA_HORZ_COORD,VGA_VERT_COORD,270,200,digit12,s12);
    //bitmap #(.font_size(8)) c(VGA_HORZ_COORD,VGA_VERT_COORD,1010,200,digit21,s21);
    //bitmap #(.font_size(8)) d(VGA_HORZ_COORD,VGA_VERT_COORD,1080,200,digit22,s22);
    score_map a(VGA_HORZ_COORD,VGA_VERT_COORD,number1,number2,score);
// Please modify below codes to change the background color and to display ticks defined above
    assign VGA_Red_Pong =   cond ? 0 : center_line||(score && win ==0)||left||right||ball ? 4'hD : 4'h0 ;
    assign VGA_Green_Pong = (win == 2 && condition[1]) ? 4'hD : cond ? 0 :center_line||(score && win ==0)||left||right||ball ? 4'hD : 4'h0 ;
    assign VGA_Blue_Pong = (win == 1 && condition[0]) ? 4'hD : cond ? 0 :center_line||(score && win ==0)||left||right||ball ? 4'hD : 4'h0 ;
endmodule
