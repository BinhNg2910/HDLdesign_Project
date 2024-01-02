`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2023 10:14:17 AM
// Design Name: 
// Module Name: countTimer
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


module countTimer(
    input clk,
    input countflag,
    input [5:0] counthr, countmin, countsec,
    output reg [5:0] countdown_counthr,
    output reg [5:0] countdown_countmin,
    output reg [5:0] countdown_countsec,    
    output reg timeout
    );
   
//    reg [5:0] countdown_counthr;
//    reg [5:0] countdown_countmin;
//    reg [5:0] countdown_countsec;

//    if (start_countdown) begin
//        timeout <= 1'b0;
//    end
    always @ (posedge clk) begin
//        if (!start_countdown) begin
//            countdown_counthr <= 6'd0;
//            countdown_countmin <= 6'd0;
//            countdown_countsec <= 6'd0;
//            timeout <= 1'b0;
//        end 
        if (countflag == 1) begin
            if (counthr == 6'd0 && countmin == 6'd0 && countsec == 6'd0) begin
                timeout <= 1'b1; // Countdown reached zero
            end 
            else if (countsec == 6'd0) begin
                countdown_countsec <= 59;
                if (countmin == 6'd0) begin
                    countdown_countmin <= 59;
                    if (counthr > 6'd0) begin
                        countdown_counthr <= counthr - 1;
                    end
                end 
                else begin
                    countdown_countmin <= countmin - 1;
                end
            end 
            else begin
                countdown_countsec <= countsec - 1;
            end
        end
    end
endmodule
