`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 09:45:48 AM
// Design Name: 
// Module Name: ex3
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


module ex3(sw0, sw1, bin, led4, led5);
    input sw0, sw1;
    input [3:0]bin;
    output reg [2:0] led4, led5;
    always @(sw0, sw1, bin) begin
        if (sw0 == 1'b0) begin
            if (sw1 == 1'b0) begin
                case(bin)
                    4'b0001: led4 = 3'b001;
                    4'b0010: led4 = 3'b010;
                    4'b0100: led4 = 3'b100;
                    4'b1000: led4 = 3'b111;
                    default: led4 = 3'b000;
                endcase
            end
            else begin
                case(bin)
                    4'b0001: led5 = 3'b001;
                    4'b0010: led5 = 3'b010;
                    4'b0100: led5 = 3'b100;
                    4'b1000: led5 = 3'b111;
                    default: led5 = 3'b000;
                endcase
            end
        end
        else begin
            if (sw1 == 1'b0) begin
                case(bin)
                    4'b0000: begin
                        led4 = 3'b000;
                        led5 = 3'b000;
                    end
                    4'b0001: begin
                        led4 = 3'b001;
                        led5 = 3'b001;
                    end
                    4'b0010: begin
                        led4 = 3'b010;
                        led5 = 3'b010;
                    end
                    4'b0100: begin
                        led4 = 3'b100;
                        led5 = 3'b100;
                    end

                    default: begin
                        led4 = 3'b111;
                        led5 = 3'b111;
                    end
                endcase
            end
            else begin
                case(bin)
                    4'b0000: begin
                        led4 = 3'b000;
                        led5 = 3'b000;
                    end
                    4'b0001: begin
                        led4 = 3'b011;
                        led5 = 3'b011;
                    end
                    4'b0010: begin
                        led4 = 3'b110;
                        led5 = 3'b110;
                    end
                    4'b0100: begin
                        led4 = 3'b101;
                        led5 = 3'b101;
                    end
                    4'b1000: begin
                        led4 = 3'b111;
                        led5 = 3'b111;
                    end

                    default: begin
                        led4 = 3'b000;
                        led5 = 3'b000;
                    end
                endcase
            end
        end
    end

endmodule
