`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2022 05:55:23 PM
// Design Name: 
// Module Name: ex2
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


module ex2 (input in, input clk, output out);
    reg temp;
    
    always @(posedge clk) begin
        temp <= in;
     end
    assign  out = in & ~temp;
endmodule
