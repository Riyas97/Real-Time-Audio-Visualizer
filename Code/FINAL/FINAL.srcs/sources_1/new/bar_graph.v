`timescale 1ns / 1ps
module bar_graph(
    input [2:0] bar_size,
    input [0:11] grid,
    input clk_sample,
    input [9:0]wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );
    reg [11:0] count = 1279;
    reg [9:0] sum = 0;
    reg  j = 0;
    reg [9:0] Sample_Memory[63:0];
    always @(posedge clk_sample) begin
        count = (count == 1279)? 0: count + 1;
        j = (count % (20 * bar_size) == 0)? 1 : 0;
        sum = (wave_sample > sum)? wave_sample : sum;
        if (j == 1)begin
            Sample_Memory[(count/(20*bar_size))*bar_size] <= (1024 - sum + 100 - (3 * (sum - 512)));
            sum = 0;
        end
    end
    wire condition = VGA_VERT_COORD >= Sample_Memory[(VGA_HORZ_COORD/(20*bar_size))*bar_size];
         
    assign VGA_Red_Grid = VGA_HORZ_COORD % (20*bar_size) == 0 && condition ? 4'hf : (condition&& (VGA_VERT_COORD < 350))? grid[0:3] : (condition && (VGA_VERT_COORD >= 350) && (VGA_VERT_COORD < 550))? 4'hf : (condition && (VGA_VERT_COORD >= 550))? 4'h6 : 4'h0;
    assign VGA_Blue_Grid = VGA_HORZ_COORD % (20*bar_size) == 0 && condition ? 4'hf : (condition && (VGA_VERT_COORD < 350))? grid[4:7] : (condition && (VGA_VERT_COORD >= 350) && (VGA_VERT_COORD < 550))? 4'hb : (condition && (VGA_VERT_COORD >= 550))? 4'hf : 4'h0;
    assign VGA_Green_Grid = VGA_HORZ_COORD % (20*bar_size) == 0 && condition ? 4'hf :(condition && (VGA_VERT_COORD < 350))? grid[8:11] : (condition && (VGA_VERT_COORD >= 350) && (VGA_VERT_COORD < 550))? 4'h7 : (condition && (VGA_VERT_COORD >= 550))? 4'h5 : 4'h0;
endmodule