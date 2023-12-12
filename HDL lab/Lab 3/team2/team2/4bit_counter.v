`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 08:05:24 AM
// Design Name: 
// Module Name: 4bit_counter
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


module bit_counter(in, clk, counter);
    input in;
    input clk;
    wire out;
    output reg [3:0] counter;
    edgeDetection ed(in , clk, out);

    always @(posedge out) begin
        if (counter == 4'b1111) counter <= 4'b0000;
        counter <= counter + 4'b0001;
    end
endmodule
