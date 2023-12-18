`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2023 04:32:43 PM
// Design Name: 
// Module Name: countClock
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


module countClock(
    input clk,
    input [3:0] btn,
    input mode,
    output reg [5:0] counthr, countmin, countsec,
    output reg countflag
    );
    
    wire p0, p1, p2, p3;
    wire [3:0] p;
    edgeDetector e0(btn[0], clk, p0);
    edgeDetector e1(btn[1], clk, p1);
    edgeDetector e2(btn[2], clk, p2);
    edgeDetector e3(btn[3], clk, p3);

    assign p = {p3, p2, p1, p0};
    
    always @(posedge clk) begin
        if (mode == 3) begin
            if(|p) begin
                case (p)
                    4'b1000: begin
                        countflag <= ~countflag;
                    end 
                    4'b0100: begin
                        if (counthr >= 23) counthr <= 6'd0; 
                        else counthr <= counthr + 1;
                    end 
                    4'b0010: begin
                        if (countmin >= 59) countmin <= 6'd0;
                        else countmin <= countmin + 1;
                    end 
                    4'b0001: begin
                        if (countsec >= 59) countsec <= 6'd0;
                        else countsec <= countsec + 1;
                    end 
                endcase
            end
        end
    end
endmodule
