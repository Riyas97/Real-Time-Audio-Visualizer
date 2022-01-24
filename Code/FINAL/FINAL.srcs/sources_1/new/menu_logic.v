`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 06:13:13 PM
// Design Name: 
// Module Name: menu_logic
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


module menu_logic(
    input up,down,center,
    input slow_clock,
    output reg [1:0] STATE = 0,
    output reg MAIN_MENU = 0,
    output reg [1:0] SIDE_MENU_GRAPH = 0,
    output reg SIDE_MENU_PONG = 0,
    output reg [1:0] GRAPH = 0,
    output reg PONG = 0,
    output reg [1:0]COLOR,
    output reg [4:0] GRAPH_STATE,
    output reg zoom,
    output reg [1:0] bar_size
    );
    always @ (posedge slow_clock)begin
    
        case(STATE)
            0://MAIN_MENU
            begin
                case(MAIN_MENU)
                    0://GRAPH
                    begin
                        if(up||down)MAIN_MENU <= 1;
                        if(center)
                        begin
                            STATE <= 1;
                            SIDE_MENU_GRAPH<=0;
                        end 
                    end
                    1://PONG
                    begin
                        if(up||down)MAIN_MENU <= 0;
                        if(center)
                        begin
                            STATE <= 2;
                            SIDE_MENU_PONG<=0;
                        end
                    end
                endcase
            end
            1://GRAPH
            begin
                case(SIDE_MENU_GRAPH)
                    0://NO_SIDE_MENU
                    begin
                        case(GRAPH_STATE)
                            0:
                            begin
                                zoom <= 0;
                                if(up)GRAPH_STATE <= 14;
                                if(down)GRAPH_STATE <= 1;
                            end
                            1:
                            begin
                                zoom <= 0;
                                if(up)GRAPH_STATE <= 0;
                                if(down)GRAPH_STATE <= 2;
                            end
                            2:
                            begin
                                zoom <= 1;
                                if(up)GRAPH_STATE <= 1;
                                if(down)GRAPH_STATE <= 3;
                            end
                            3:
                            begin
                                if(up)GRAPH_STATE <= 2;
                                if(down)GRAPH_STATE <= 4; 
                            end
                            4:
                            begin
                                bar_size = 1;
                                if(up)GRAPH_STATE <= 3;
                                if(down)GRAPH_STATE <= 5;
                            end
                            5:
                            begin
                                bar_size = 2;
                                if(up)GRAPH_STATE <= 4;
                                if(down)GRAPH_STATE <= 6;
                            end
                            6:
                            begin
                                if(up)GRAPH_STATE <= 5;
                                if(down)GRAPH_STATE <= 7;
                            end
                            7:
                            begin
                                if(up)GRAPH_STATE <= 6;
                                if(down)GRAPH_STATE <= 8;
                            end
                            8:
                            begin
                                if(up)GRAPH_STATE <= 7;
                                if(down)GRAPH_STATE <= 9;
                            end
                            9:
                            begin
                                if(up)GRAPH_STATE <= 8;
                                if(down)GRAPH_STATE <= 10;
                            end
                            10:
                            begin
                                if(up)GRAPH_STATE <= 9;
                                if(down)GRAPH_STATE <= 11;                            
                            end
                            11:
                            begin
                                if(up)GRAPH_STATE <= 10;
                                if(down)GRAPH_STATE <= 12;
                            end
                            12:
                            begin
                                if(up)GRAPH_STATE <= 11;
                                if(down)GRAPH_STATE <= 13;
                            end
                            13:
                            begin
                                if(up)GRAPH_STATE <= 12;
                                if(down)GRAPH_STATE <= 14;
                            end
                            14:
                            begin
                                if(up)GRAPH_STATE <= 13;
                                if(down)GRAPH_STATE <= 0;
                            end
                        endcase
                        if(center)
                        begin
                            SIDE_MENU_GRAPH <= 1;
                            GRAPH <= 0;
                        end
                    end
                    1://SIDE_MENU
                    begin
                        case(GRAPH)
                            0://MAIN_MENU
                            begin
                                if(up)GRAPH<=2;
                                if(down)GRAPH<=1;
                                if(center)STATE<=0;
                            end
                            1://COLOR_SEL
                            begin
                                if(up)GRAPH<=0;
                                if(down)GRAPH<=2;
                                if(center)SIDE_MENU_GRAPH <= 2;
                            end
                            2://EXIT
                            begin
                                if(up)GRAPH<=1;
                                if(down)GRAPH<=0;
                                if(center)SIDE_MENU_GRAPH <= 0;
                            end
                        endcase
                    end
                    2://COLOR_SEL
                    begin
                        case(COLOR)
                            0://RED
                            begin
                                if(up)COLOR<=3;
                                if(down)COLOR<=1;
                            end
                            1://GREEN
                            begin
                                if(up)COLOR<=0;
                                if(down)COLOR<=2;
                            end
                            2://BLUE
                            begin
                                if(up)COLOR<=1;
                                if(down)COLOR<=3;
                            end
                            3://GOBACK
                            begin
                                if(up)COLOR<=2;
                                if(down)COLOR<=3;
                                if(center)SIDE_MENU_GRAPH<=1;
                            end
                        endcase
                    end
                endcase
            end
            2://PONG
            begin
                case(SIDE_MENU_PONG)
                    0://NO_SIDE_MENU
                        if(center)
                        begin
                            SIDE_MENU_PONG <= 1;
                            PONG<=0;
                        end
                    1://SIDE_MENU
                    begin
                        case(PONG)
                            0://MAIN_MENU
                            begin
                                if(up||down)PONG<=1;
                                if(center)
                                begin
                                    STATE<=0;
                                    MAIN_MENU<=0;
                                end
                            end
                            1://EXIT
                            begin
                                if(up||down)PONG<=0;
                                if(center)SIDE_MENU_PONG<=0;
                            end
                        endcase
                    end
                endcase
            end
        endcase
    end
endmodule
