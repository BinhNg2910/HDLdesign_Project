`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 09:01:02 PM
// Design Name: 
// Module Name: 2bit
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


module comparator_2bit(
	output a_gt_b, a_lt_b, a_eq_b,
	input [1:0] a, b
	);
	
	wire not_out_0, not_out_1,
		 xnor_out_0, xnor_out_1,
		 and_out_0, and_out_1, and_out_2, and_out_3,
		 or_out_0,
		 nor_out_0;
	
	not not0(not_out_0, a[1]);
	not not1(not_out_1, a[0]);
	xnor xnor0(xnor_out_0, b[1], a[1]);
	xnor xnor1(xnor_out_1, b[0], a[0]);
	
	and and0(and_out_0, not_out_0, b[1]);
	and and1(and_out_1, not_out_0, not_out_1, b[0]);
	and and2(and_out_2, not_out_1, b[1], b[0]);
	and and3(and_out_3, xnor_out_0, xnor_out_1);
	
	or or0(or_out_0, and_out_0, and_out_1, and_out_2);
	
	nor nor0(nor_out_0, or_out_0, and_out_3);
	
	assign a_gt_b = nor_out_0;
	assign a_lt_b = or_out_0;
	assign a_eq_b = and_out_3;
endmodule
	
