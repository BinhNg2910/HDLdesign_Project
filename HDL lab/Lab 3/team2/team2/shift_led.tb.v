`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 02:02:12 PM
// Design Name: 
// Module Name: string_led_tb
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


module string_led_tb;
reg clk,rst;
reg [3:0] but;
wire [3:0] led;
string_bit_led c(clk,led,but,rst);
initial clk=1'b0;
always #5 clk=~clk;
initial begin
rst = 1'b1; but=4'b0000;
#100 rst = 1'b0; but =4'b0001;
#200 but=4'b0000;
#50 but=4'b0010;
#200 but=4'b0100;
#200 but=4'b1000;
#200 but=4'b0100;
#200;
end

endmodule
