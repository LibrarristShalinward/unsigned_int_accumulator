`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/06 12:12:18
// Design Name: 
// Module Name: bite_accumulator
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


module bite_accumulator(
    input in1,
    input in2,
    input prev_cf,
    output out,
    output post_cf);
    assign out = (in1 & in2 & prev_cf) | (in1 & ~in2 & ~prev_cf) | (~in1 & in2 & ~prev_cf) | (~in1 & ~in2 & prev_cf); 
    assign post_cf = (in1 & in2) | (in1 & prev_cf) | (in2 & prev_cf); 
endmodule
