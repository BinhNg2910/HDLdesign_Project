`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 03:53:48 PM
// Design Name: 
// Module Name: adder4b_tb
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


module adder4b_tb;
    reg [4:0]a, b;
    reg c_in;
    wire [3:0]s;
    wire c_out;

    //UUT
    adder4b uut(c_out, s, a, b, c_in);
    initial $monitor ("%t: a: %d, b: %d, c_in: %d, s: %d, c_out: %d",$time, a, b, c_in, s, c_out);

    initial begin
        c_in = 1'b0;
        for (a = 0; a < 16; a = a+1)
            for (b = 0; b < 16; b = b+1)#10;
        #10 c_in = 1'b1;
        for (a = 0; a < 16; a = a+1)
            for (b = 0; b < 16; b = b+1)#10;
        $stop;
    end
endmodule
