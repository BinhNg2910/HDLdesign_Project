`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 09:16:16 AM
// Design Name: 
// Module Name: ex1_tb
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


module ex1_tb;
reg [4:0]in;
	wire [3:0]out;
ex1 uut(in, out);
initial $monitor ("%t: in: %b, out: %b", $time, in, out);

initial begin
for(in = 0; in <16; in = in + 1) #10;
$stop;
end
endmodule
