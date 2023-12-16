`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 08:57:28 AM
// Design Name: 
// Module Name: combine
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


module combine(led1, led2, led3, led4, led5, led6, l_red, l_blue, sw0, sw1, btn, clk);
    input sw0, sw1;
    input [3:0] btn;
    input clk;
    output [6:0] led1, led2;
    output [6:0] led3, led4;
    output [6:0] led5, led6;
    output l_red, l_blue;

    wire enb;
    wire al_on;

    wire [3:0] h1, h2, m1, m2, s1, s2;
    wire [3:0] dd1, dd2, mm1, mm2;
    
    reg [3:0] led1_reg, led2_reg, led3_reg, led4_reg, led5_reg, led6_reg; 
    
    wire [5:0] hr, min, sec;
//    wire [5:0] a_hr , a_min;
    wire [5:0] dd, mm;
    wire [5:0] a_hr1, a_hr2, a_min1, a_min2;
    
    reg [3:0] mode_controller;
    reg [3:0] sw1_prev;
    
    get1hz get(clk, enb);
//    buttons but(clk, enb, sw0, sw1, btn, a_hr, a_min);
//    clock dc(clk, enb, sw0, sw1, btn, hr, min, sec);
//    alarmClk alarm(clk, btn, sw0, hr, min, sec, a_hr, a_min, mode_controller, h1, h2, m1, m2, s1, s2, al_on);
    clock dc(clk, enb, sw0, sw1, btn, mode_controller, hr, min, sec);
    alarmClk alarm(clk, btn, sw0, hr, min, sec, mode_controller, a_hr1, a_hr2, a_min1, a_min2, al_on);
    mmdd monthDate(clk, enb, sw1, btn, hr, min, sec, mm1, mm2, dd1, dd2);
    policeSiren alert(al_on, clk, l_red, l_blue);

    assign h1 = hr / 6'd10;
    assign h2 = hr% 6'd10;
    assign m1 = min / 6'd10;
    assign m2 = min % 6'd10;
    assign s1 = sec / 6'd10;
    assign s2 = sec % 6'd10;

    display dis1(led1, led1_reg);
    display dis2(led2, led2_reg);
    display dis3(led3, led3_reg);
    display dis4(led4, led4_reg);
    display dis5(led5, led5_reg);
    display dis6(led6, led6_reg);

    //display on led whether it is mm/dd or hh/mm/ss
    always @(posedge clk) begin
        if(sw1 == 1 & ~sw1_prev) begin
            if(mode_controller >= 3'b011) mode_controller <= 3'b000;
            else mode_controller <= mode_controller + 1;
        end
        sw1_prev <= sw1;
        if(mode_controller == 0) begin
            led1_reg <= h1;
            led2_reg <= h2;
            led3_reg <= m1;
            led4_reg <= m2;
            led5_reg <= s1;
            led6_reg <= s2;
        end
        else if(mode_controller == 1) begin
            led1_reg <= mm1;
            led2_reg <= mm2;
            led3_reg <= dd1;
            led4_reg <= dd2;
            led5_reg <= 0;
            led6_reg <= 0;            
        end
        else if(mode_controller == 2) begin
            led1_reg <= mm1;
            led2_reg <= mm2;
            led3_reg <= dd1;
            led4_reg <= dd2;
            led5_reg <= 0;
            led6_reg <= 0;
        end
        else if(mode_controller == 3) begin
        end
    end

endmodule
