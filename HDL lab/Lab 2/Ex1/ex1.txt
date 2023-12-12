`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 08:02:06 AM
// Design Name: 
// Module Name: project1
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


module ex1(in, out);
    input [3:0]in;
    output reg [3:0]out;
    always @(in) begin
        if (in == 4'b0000) out = 4'b0100;
        else if (in == 4'b1111) out = 4'b1000;
        else if (^in == 0) out = 4'b0001;
        else if (in == 4'b0001 || in==4'b0010 || in == 4'b0100 || in == 4'b1000) out = 4'b0010;
        else out = 4'bxxxx;
    end
endmodule	