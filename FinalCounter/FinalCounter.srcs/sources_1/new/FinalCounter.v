`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSUST
// Engineer: Joy Dee
// 
// Create Date: 2021/06/16 15:16:32
// Design Name: 可控进制的计数器
// Module Name: FinalCounter
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


module FinalCounter(
    input opt,
    input clk,
    input rst,
    output reg[7:0] dis
    );
    
    reg[3:0] cnt;

    initial cnt = 0;
    
    always @(posedge clk or posedge rst)
    begin
        if(rst) //异步清零
        begin
           cnt = 4'b0000;
        end
        else
        begin
        if(!opt) //8进制
        begin
            if(cnt == 4'b0111)
            begin //进位
                cnt = 4'b0000;
            end
            
            else 
            begin
                cnt = cnt + 4'b0001;
            end
        end
        else //15进制
        begin
            if(cnt == 4'b1110)
            begin //进位
                cnt = 4'b0000;
            end
            
            else
            begin
                cnt = cnt + 4'b0001;
            end
        end
        end
    end 
    
    wire[7:0] AN;

    assign AN = 8'b00000000;
    always @(*) begin
        case (cnt)
            4'b0000: dis = 8'b00000011;	//0
            4'b0001: dis = 8'b10011111;	//1
            4'b0010: dis = 8'b00100101;	//2
            4'b0011: dis = 8'b00001101;	//3
            4'b0100: dis = 8'b10011001;	//4
            4'b0101: dis = 8'b01001001;	//5
            4'b0110: dis = 8'b01000001;	//6
            4'b0111: dis = 8'b00011111;	//7
            4'b1000: dis = 8'b00000001;	//8
            4'b1001: dis = 8'b00001001; //9
            4'b1010: dis = 8'b00010001;	//A
            4'b1011: dis = 8'b11000001;	//b
            4'b1100: dis = 8'b01100011;	//C
            4'b1101: dis = 8'b10000101;	//d
            4'b1110: dis = 8'b01100001;	//E
            4'b1111: dis = 8'b01110001;	//F
            default: dis = 8'b10000001;	//0
        endcase
    end
endmodule
