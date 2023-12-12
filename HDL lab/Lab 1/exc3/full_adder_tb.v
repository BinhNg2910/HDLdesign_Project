`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2022 01:50:43 PM
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb;
    reg[1:0] a, b;
    reg c_in;
    wire s, c;

    //UUT
    full_adder uut(c,s,a,b,c_in);
    initial $monitor ("%b: a, %b: b, %b:c_in, %b: s, %b: c", a,b,c_in, s, c);

    initial begin
        c_in = 1'b0;
        for (a = 0; a < 2; a = a+1)
            for (b = 0; b < 2; b = b+1)#10;
        #10 c_in = 1'b1;
        for (a = 0; a < 2; a=a+1)
            for (b = 0; b < 2; b=b+1)#10;
        $stop;
    end
endmodule
