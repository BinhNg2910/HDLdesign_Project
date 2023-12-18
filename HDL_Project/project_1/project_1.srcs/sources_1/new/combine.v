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
    wire al_on, timeout_on, count_flag;

    wire [3:0] h1, h2, m1, m2, s1, s2;
    wire [3:0] dd1, dd2, mm1, mm2;
    wire [3:0] counth1, counth2, countm1, countm2, counts1, counts2;
    
    reg [3:0] led1_reg, led2_reg, led3_reg, led4_reg, led5_reg, led6_reg; 
    
    wire [5:0] hr, min, sec;
//    wire [5:0] a_hr , a_min;
    wire [5:0] dd, mm;
    wire [5:0] a_hr1, a_hr2, a_min1, a_min2;
    wire [5:0] counthr, countmin, countsec;
    
    reg [3:0] mode_controller;
    reg [3:0] sw1_prev;
    
    get1hz get(clk, enb);
//    buttons but(clk, enb, sw0, sw1, btn, a_hr, a_min);
//    clock dc(clk, enb, sw0, sw1, btn, hr, min, sec);
//    alarmClk alarm(clk, btn, sw0, hr, min, sec, a_hr, a_min, mode_controller, h1, h2, m1, m2, s1, s2, al_on);
    clock dc(clk, enb, btn, mode_controller, hr, min, sec);
    alarmClk alarm(clk, btn, sw0, hr, min, mode_controller, a_hr1, a_hr2, a_min1, a_min2, al_on);
    mmdd monthDate(clk, enb, sw1, btn, hr, min, sec, mm1, mm2, dd1, dd2);
    countClock counting(clk, btn, mode_controller, counthr, countmin, countsec, count_flag);
    countTimer countDown(clk, count_flag, counthr, countmin, countsec, counthr, countmin, countsec, timeout_on);
    policeSiren alert(al_on, timeout_on, clk, l_red, l_blue);

    assign h1 = hr / 6'd10;
    assign h2 = hr % 6'd10;
    assign m1 = min / 6'd10;
    assign m2 = min % 6'd10;
    assign s1 = sec / 6'd10;
    assign s2 = sec % 6'd10;

    assign counth1 = counthr / 6'd10;
    assign counth2 = counthr % 6'd10;
    assign countm1 = countmin / 6'd10;
    assign countm2 = countmin % 6'd10;
    assign counts1 = countsec / 6'd10;
    assign counts2 = countsec % 6'd10;

    display dis1(led1, led1_reg);
    display dis2(led2, led2_reg);
    display dis3(led3, led3_reg);
    display dis4(led4, led4_reg);
    display dis5(led5, led5_reg);
    display dis6(led6, led6_reg);

    //display on led whether it is mm/dd or hh/mm/ss
    always @(posedge clk) begin
        if(sw1 == 1 & ~sw1_prev) begin
            if(mode_controller >= 3'b101) mode_controller <= 3'b000;
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
            led1_reg <= a_hr1;
            led2_reg <= a_hr2;
            led3_reg <= a_min1;
            led4_reg <= a_min2;
            led5_reg <= 0;
            led6_reg <= 0;
        end
        else if(mode_controller == 3) begin
            led1_reg <= counth1;
            led2_reg <= counth2;
            led3_reg <= countm1;
            led4_reg <= countm2;
            led5_reg <= counts1;
            led6_reg <= counth2;        
        end
        else if(mode_controller == 4) begin
            led1_reg <= 2;
            led2_reg <= 2;
            led3_reg <= 2;
            led4_reg <= 2;
            led5_reg <= 2;
            led6_reg <= 2;        
        end
        else begin
            led1_reg <= 9;
            led2_reg <= 9;
            led3_reg <= 9;
            led4_reg <= 9;
            led5_reg <= 9;
            led6_reg <= 9;                
        end
    end
endmodule
