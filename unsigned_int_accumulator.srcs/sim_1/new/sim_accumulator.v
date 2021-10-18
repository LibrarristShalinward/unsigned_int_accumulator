`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/06 12:19:58
// Design Name: 
// Module Name: sim_accumulator
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


module sim_accumulator();
    reg in10, in11, in12, in13; 
    reg in20, in21, in22, in23;
    reg clk, rst;
    wire out0, out1, out2, out3; 
    wire overflow;
    wire [6:0] a_g_a, a_g_b; 
    wire [3:0] an, bn;
     
    initial begin
        in10 = 1'b0; 
        in11 = 1'b0; 
        in12 = 1'b0; 
        in13 = 1'b1; 
        in20 = 1'b1; 
        in21 = 1'b1; 
        in22 = 1'b1; 
        in23 = 1'b1; 
        clk = 1'b0;
        rst = 1'b0;
        #1 rst = 1'b1;
        #3000000000;
    end
    
    always #5 clk = ~clk;
    
    unsigned_int_accumulator uut(
    .in10(in10), 
    .in11(in11), 
    .in12(in12), 
    .in13(in13), 
    .in20(in20), 
    .in21(in21), 
    .in22(in22), 
    .in23(in23),
    .clk(clk),
    .rst(rst), 
    .out0(out0), 
    .out1(out1), 
    .out2(out2), 
    .out3(out3),
    .overflow(overflow), 
    .a_g_a(a_g_a),
    .a_g_b(a_g_b),
    .an(an),
    .bn(bn)
);
endmodule
