`timescale 1ns / 1ps

module alarmClk(
    input clk,
    input [3:0] btn,
    input sw0,
    input [5:0] c_hour, c_min,
//    input [5:0] a_hr, a_min,
    input mode,
//    output reg [3:0] hr1, hr2, min1, min2, s1, s2,
    output [5:0] a_hr1, a_hr2, a_min1, a_min2,
    output reg alarm
);
    wire [3:0] c_hr1, c_hr2, c_min1, c_min2, c_sec1, c_sec2;
    wire [3:0] a_hr1_tmp, a_hr2_tmp, a_min1_tmp, a_min2_tmp;
    reg [5:0] a_hr, a_min;

    //    policeSiren alert(alarm, clk, l_red, l_blue);

    always @(c_hour, c_min, a_hr, a_min, sw0) begin
        if (sw0 == 1'b1) begin
            if ({c_hour, c_min} == {a_hr, a_min}) alarm <= 1'b1;
            else alarm <= 1'b0;
        end
        else alarm <= 1'b0;
    end

    wire p0, p1, p2, p3;
    wire [3:0] p;
    edgeDetector e0(btn[0], clk, p0);
    edgeDetector e1(btn[1], clk, p1);
    edgeDetector e2(btn[2], clk, p2);
    edgeDetector e3(btn[3], clk, p3);

    assign p = {p3, p2, p1, p0};

    always @(posedge clk) begin
        if(mode == 2) begin
            if (|p) begin
                case (p)
                    4'b0100: begin
                        //Display alarm
                        if(a_min >= 59) begin
                            a_min = 6'd0;
                        end
                        else a_min = a_min + 1;          
                    end
                    4'b1000: begin
                        //Display alarm
                        if(a_hr >= 23)
                            a_hr = 6'd0; 
                    end
                    4'b0001: begin
                        //Display alarm
                        if(a_min <= 0) begin
                            a_min = 6'd59;

                        end
                        else a_min = a_min + 1;
                    end
                    4'b0010: begin
                        //Display alarm
                        if(a_hr <= 0)
                            a_hr = 6'd23; 
                    end                    
                endcase
            end
        end
    end
    assign a_hr1_tmp = a_hr/6'd10;
    assign a_hr2_tmp = a_hr%6'd10;
    assign a_min1_tmp = a_min/6'd10;
    assign a_min2_tmp = a_min%6'd10;

endmodule
