`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 02:48:27 PM
// Design Name: 
// Module Name: ex1_b
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


module ex1_b(clk, rst, ledR, ledG);
    input clk, rst;
    output reg ledR, ledG;
    
    parameter r = 31'd625000000;
    parameter g = 31'd1250000000;
    parameter y = 31'd1625000000;
    integer count = 0;
    
    always @(posedge clk) begin
        if(rst) begin
        ledR = 1'b0;
        ledG = 1'b0;
        count = 1'd0;
        end
        else begin
            case(count)
                1'b0:ledR=1'b1;
                r: begin
                    ledR=1'b0;
                    ledG=1'b1;
                    end
                g: begin
                    ledR=1'b1;
                   end
                y: begin
                     ledG = 1'b0;
                     ledR = 1'b1;
                     count = 0;
                   end
                default: begin
                        ledR = ledR;
                        ledG = ledG;
                         end
            endcase
            count = count + 1;
         end
end   
endmodule
