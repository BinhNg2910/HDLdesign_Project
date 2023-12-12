`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 02:33:45 PM
// Design Name: 
// Module Name: string_bit_led
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


module string_bit_led(clk,led,but,rst);
output[3:0] led;
input rst;
reg [1:0] state, next_state;
parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
input clk;
input [3:0] but;
reg [3:0] temp=4'b0000;
wire e_clk;
reg [26:0]counter;
always @(posedge clk) begin
    counter <=counter+1;
    if (counter==125_000_000-1) begin
        counter<=0;
    end
end 
assign e_clk = (counter == 125_000_000-1) ? 1:0;
always @(posedge clk, posedge rst) begin
    if (rst) state<=S0; 
    else  state <= next_state;
end
always @(state,but) begin 
    case(state)
        S0: case(but)
                4'b0001:next_state=S0;
                4'b0010:next_state=S1;
                4'b0100:next_state=S2;
                4'b1000:next_state=S3;
                default: next_state=S0;
            endcase
        S1: case(but)
                4'b0001:next_state=S0;
                4'b0010:next_state=S1;
                4'b0100:next_state=S2;
                4'b1000:next_state=S3;
                default: next_state=S1;
            endcase
        S2: case(but)
                4'b0001:next_state=S0;
                4'b0010:next_state=S1;
                4'b0100:next_state=S2;
                4'b1000:next_state=S3;
                default: next_state=S2;
            endcase
        S3: case(but)
                4'b0001:next_state=S0;
                4'b0010:next_state=S1;
                4'b0100:next_state=S2;
                4'b1000:next_state=S3;
                default: next_state=S3;
            endcase
    endcase
end

always @(posedge clk) begin
    if (e_clk) begin 
    case (state)
        S0: temp<=4'b0011;
        S1: temp<={temp[2:0],temp[3]};
        S2: temp<={temp[0],temp[3:1]};
        S3: temp<=temp;
        default: temp<=4'b0011;
    endcase 
    end
 end
 assign led=temp; 
endmodule
