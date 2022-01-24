`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2019 12:57:49 PM
// Design Name: 
// Module Name: vol_indi
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


module vol_indi(
    input [9:0] in_wave,
    input clk,
    output reg [11:0] led,
    output reg [3:0] level
    );
    
    reg [11:0] count = 0;
    reg [9:0] max = 0;
    
    always @(posedge clk) begin
    count <= (count == 1999)? 0: count + 1;
        if (max < in_wave) begin
            max <= in_wave;
        end
        if(count == 1999) begin
            level <= max[8:5];
       
            case(max[8: 5])
                0: led <= 0;
                1: led <= 1;
                2: led <= 3;
                3: led <= 7;
                4: led <= 15;
                5: led <= 31;
                6: led <= 63;
                7: led <= 128;
                8: led <= 255;
                9: led <= 511;
                10: led <= 1023;
                11: led <= 1023;
                12: led <= 2047;
                13: led <= 2047;
                14: led <= 4095;
                15: led <= 4095;
             endcase
                max <= 0;
        end
    end
endmodule