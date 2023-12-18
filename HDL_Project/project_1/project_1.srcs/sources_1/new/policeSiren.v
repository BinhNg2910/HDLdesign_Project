`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 08:49:37 PM
// Design Name: 
// Module Name: policeSiren
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


module policeSiren(enb_alarm, enb_count, clk_in, clk_out_red, clk_out_blue);
    input enb_alarm, enb_count;
    input clk_in;
    output reg clk_out_red, clk_out_blue;
    reg [27:0] counter_red = 28'd0;
    reg [27:0] counter_blue = 28'd0;
    parameter Div = 125000000;
    
    always @(posedge clk_in) begin
        if (enb_alarm) begin
            counter_red <= counter_red + 28'd1;
            if (counter_red >= (Div-1)) counter_red <= 28'd0;
            clk_out_red <= (counter_red < Div/2)? 1'b1 : 1'b0;
        end

        if (enb_count) begin
            counter_blue <= counter_blue + 28'd1;
            if (counter_blue >= (Div-1)) counter_blue <= 28'd0;
            clk_out_blue <= (counter_blue < Div/2)? 1'b1 : 1'b0;
        end
    end
endmodule
