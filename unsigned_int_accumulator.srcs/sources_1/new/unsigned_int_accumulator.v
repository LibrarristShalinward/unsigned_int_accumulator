`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/06 11:59:30
// Design Name: 
// Module Name: unsigned_int_accumulator
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


module unsigned_int_accumulator(
    input in10, in11, in12, in13, 
    input in20, in21, in22, in23, 
    output out0, out1, out2, out3, 
    output overflow);
    
    wire cf0, cf1, cf2; 
    
    bite_accumulator bite_accumulator0(
    .in1(in10), 
    .in2(in20), 
    .prev_cf(1'b0), 
    .out(out0), 
    .post_cf(cf0));
    bite_accumulator bite_accumulator1(
    .in1(in11), 
    .in2(in21), 
    .prev_cf(cf0), 
    .out(out1), 
    .post_cf(cf1));
    bite_accumulator bite_accumulator2(
    .in1(in12), 
    .in2(in22), 
    .prev_cf(cf1), 
    .out(out2), 
    .post_cf(cf2));
    bite_accumulator bite_accumulator3(
    .in1(in13), 
    .in2(in23), 
    .prev_cf(cf2), 
    .out(out3), 
    .post_cf(overflow));
endmodule
