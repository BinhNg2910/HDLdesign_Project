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
    input enb,
    input [3:0] mode,
    input [3:0] btn,
    output reg [5:0] counthr, countmin, countsec,
    output reg countflag,
    output reg timeout
    );
    
    wire p0, p1, p2, p3;
    wire [3:0] p;
    edgeDetector e0(btn[0], clk, p0);
    edgeDetector e1(btn[1], clk, p1);
    edgeDetector e2(btn[2], clk, p2);
    edgeDetector e3(btn[3], clk, p3);

    assign p = {p3, p2, p1, p0};
    
    always @ (posedge clk) begin
        if (mode == 3) begin
            if(|p) begin
                case (p)
                    4'b1000: begin
                        if (counthr >= 23) counthr <= 6'd0; 
                        else counthr <= counthr + 1;
                    end 
                    4'b0100: begin
                        if (countmin >= 59) countmin <= 6'd0;
                        else countmin <= countmin + 1;
                    end 
                    4'b0010: begin
                        if (countsec >= 59) countsec <= 6'd0;
                        else countsec <= countsec + 1;
                    end 
                    4'b0001: begin
//                        if (countflag == 0) countflag <= 1;
//                        else begin 
//                            countflag <= 0;
//                            timeout <= 0;
//                        end
                        countflag <= ~countflag;
                    end 
                endcase
            end
        end
        if (enb) begin
        if (countflag) begin
            if (counthr == 6'd0 && countmin == 6'd0 && countsec == 6'd0) begin
                timeout <= 1; // Countdown reached zero
            end
            else if (countsec == 6'd0) begin
                if (countmin == 6'd0) begin
                    if (counthr > 6'd0) begin
                        counthr <= counthr - 1;
                        countmin <= 59;
                        countsec <= 59;
                    end
                end
                else begin
                    countmin <= countmin - 1;
                    countsec <= 59;
                end
            end 
            else begin
                countsec <= countsec - 1;
            end
        end
        else timeout <= 0;
        end
    end
endmodule
