`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 10:12:35 AM
// Design Name: 
// Module Name: siren_tb
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


module siren_tb;
    reg clk_in = 0;
    wire clk_out_red, clk_out_blue;
policeSiren uut(clk_in, clk_out_red, clk_out_blue);
initial $monitor ("$t: clkn_in: clk_out_red:  clk_out_blue: ", $time, clk_in, clk_out_red, clk_out_blue);

always #50 clk_in = ~clk_in;

endmodule
