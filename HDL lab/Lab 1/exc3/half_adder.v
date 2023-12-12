`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2022 06:02:26 PM
// Design Name: 
// Module Name: ag
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

module half_adder(sum, carry, a, b);
input wire a, b;
output wire sum, carry;
xor sum0(sum, a, b);
and carry0(carry, a,b);
endmodule
