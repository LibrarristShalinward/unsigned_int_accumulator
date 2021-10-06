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
    wire out0, out1, out2, out3; 
    wire overflow;
     
    initial begin
        in10 = 1'b0; 
        in11 = 1'b0; 
        in12 = 1'b0; 
        in13 = 1'b0; 
        in20 = 1'b0; 
        in21 = 1'b0; 
        in22 = 1'b0; 
        in23 = 1'b0; 
        #2560;
    end
    
    always #10 in10 = ~in10; 
    always #20 in11 = ~in11; 
    always #40 in12 = ~in12; 
    always #80 in13 = ~in13; 
    always #160 in20 = ~in20; 
    always #320 in21 = ~in21; 
    always #640 in22 = ~in22; 
    always #1280 in23 = ~in23; 
    
    unsigned_int_accumulator uut(
    .in10(in10), 
    .in11(in11), 
    .in12(in12), 
    .in13(in13), 
    .in20(in20), 
    .in21(in21), 
    .in22(in22), 
    .in23(in23), 
    .out0(out0), 
    .out1(out1), 
    .out2(out2), 
    .out3(out3),
    .overflow(overflow)); 
endmodule
