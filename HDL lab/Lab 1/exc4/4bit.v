`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 09:01:56 PM
// Design Name: 
// Module Name: 4bit
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


module four_bit_comp(a_lt_b, a_eq_b, a_gt_b, a, b);
    input [3:0] a, b;
    output a_lt_b, a_eq_b, a_gt_b;
    
    wire g1, g2, l1, l2, e1, e2;
    
    comparator_2bit high_order(g2, l2, e2, a[3:2], b[3:2]);
    comparator_2bit low_order(g1, l1, e1, a[1:0], b[1:0]);
    
    assign a_gt_b = (g2)|(e2&g1);
    assign a_lt_b = (l2)|(e2&l1);
    assign a_eq_b = e1&e2; 
endmodule
