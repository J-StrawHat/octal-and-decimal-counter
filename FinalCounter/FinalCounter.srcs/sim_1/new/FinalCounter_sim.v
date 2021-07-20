`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSUST
// Engineer: Joy Dee
// 
// Create Date: 2021/06/16 23:41:27
// Design Name: 
// Module Name: FinalCounter_sim
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


module FinalCounter_sim();
    reg opt;
    reg clk;
    reg rst;
    wire[7:0] dis;
    FinalCounter test(
        .opt(opt),
        .clk(clk),
        .rst(rst),
        .dis(dis)
    );
    initial
    begin
        clk = 0;
        rst = 0;
        opt = 0;
    end
    always #20 clk = ~clk;
endmodule
