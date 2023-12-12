`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 06:03:27 PM
// Design Name: 
// Module Name: g
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


module full_adder(c_out, sum, a, b, c_in);
    input wire a,b,c_in;
    output wire c_out, sum;

    wire c0, s0;
    wire c1, s1;

    half_adder half_adder0(s0, c0, a, b);
    half_adder half_adder1(sum, c1, s0, c_in);
    or (c_out, c0, c1);
endmodule
