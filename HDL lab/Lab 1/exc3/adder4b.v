`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 06:04:27 PM
// Design Name: 
// Module Name: gd
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

module adder4b (c_out, s, a, b, c_in);
    input [3:0]a, b;
    input c_in;
    output [3:0]s;
    output c_out;
    wire c1, c2, c3;

    full_adder f1(c1, s[0], a[0], b[0], c_in);
    full_adder f2(c2, s[1], a[1], b[1], c1);
    full_adder f3(c3, s[2], a[2], b[2], c2);
    full_adder f4(c_out, s[3], a[3], b[3], c3);

endmodule
