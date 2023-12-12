`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 08:51:24 PM
// Design Name: 
// Module Name: ex2_tb
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


module ex2_tb();
    reg clk, in;
    wire out;

    
    ex2 UUT(clk, in, out);
    
initial $monitor("time: in: out: ", $time, clk, in, out);
        initial clk = 1'b0;
        always #5 clk = ~clk;

        
        initial begin
            in = 1'b0;
            #17 in = 1'b1;
            #17 in = 1'b0;
            #20 in = 1'b1;
            #18 in = 1'b0;
            #20 $stop;
            end
endmodule
