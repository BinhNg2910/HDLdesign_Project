`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 05:20:24 PM
// Design Name: 
// Module Name: ex1_b_test
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


module ex1_b_test();
    reg clk, rst;
    wire ledR, ledG;
    
    ex1_b UUT(clk, rst, ledR, ledG);
    
    defparam UUT.r = 4'd5;
    defparam UUT.g = 4'd10;
    defparam UUT.y = 4'd13;
    
    initial $monitor("time: clk: rst: ledR: ledG: ", $time, clk, ledR, ledG);
    
    initial begin 
            clk = 1'b0;
            forever #1 clk = ~clk;
            end
            
    initial begin
            rst = 1'b1;
            #10 rst = 1'b0;
            #30 $stop;
            end
endmodule
