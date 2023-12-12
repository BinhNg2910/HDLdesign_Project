`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 08:09:23 AM
// Design Name: 
// Module Name: edgeDetection
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


module edgeDetection(input in, input clk, output out);
    reg sig_delay;
    
    always @(posedge clk) begin
        sig_delay <= in;
    end
   
    assign out = in & ~sig_delay;

endmodule
