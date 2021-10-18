`timescale 1ns / 1ps

module unsigned_int_accumulator(
    input in10, in11, in12, in13, 
    input in20, in21, in22, in23, 
    input clk, //时钟信号
    input rst, //复位信号
    output out0, out1, out2, out3, 
    output overflow,
    output reg [6:0] a_g_a, //第一组段信号
    output reg [6:0] a_g_b, //第二组段信号
    output reg [3:0] an, //第一组位选信号
    output reg [3:0] bn); //第二组位选信号
    
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
    
    reg [20:0] clkdiv;
    always @(posedge clk or negedge rst) begin
        if(!rst)
            clkdiv <= 21'd0;
        else
            clkdiv <= clkdiv + 1;
    end
    
    wire [1:0] bitcnt;
    assign bitcnt = clkdiv[20:19];
    
    always @* begin
        if(!rst)
            begin
                an = 4'd0;
                bn = 4'd0;
            end
        else
            begin
                an = 4'd0;
                bn = 4'd0;
                an[bitcnt] = 1;
                bn[bitcnt] = 1;
            end
    end
    
    reg [3:0] digita;
    reg [3:0] digitb;
    always @* begin
        if(!rst)
            begin
                digita = 4'd0;
                digitb = 4'd0;
            end
        else
            case(bitcnt)
                2'd0: 
                    begin
                        digita = {in23, in22, in21, in20} / 10;                        
                        digitb = {overflow, out3, out2, out1, out0} % 10;
                    end
                2'd1: 
                    begin
                        digita = 10;
                        digitb = {overflow, out3, out2, out1, out0} / 10;
                    end
                2'd2:
                    begin
                        digita = {in13, in12, in11, in10} % 10;
                        digitb = 11;
                    end
                2'd3: 
                    begin
                        digita = {in13, in12, in11, in10} / 10;
                        digitb = {in23, in22, in21, in20} % 10;
                    end
                default: 
                    begin
                        digita = 4'd0;
                        digitb = 4'd0;
                    end
            endcase
    end
    
    
    always @* begin
        if(!rst)
            begin
                a_g_a = 7'b1111111;
                a_g_b = 7'b1111111;
            end
        else
            case(digita)
                0: a_g_a = 7'b1111110;
                1: a_g_a = 7'b0110000;
                2: a_g_a = 7'b1101101;
                3: a_g_a = 7'b1111001;
                4: a_g_a = 7'b0110011;
                5: a_g_a = 7'b1011011;
                6: a_g_a = 7'b1011111;
                7: a_g_a = 7'b1110000;
                8: a_g_a = 7'b1111111;
                9: a_g_a = 7'b1111011;
                10: a_g_a = 7'b1110111;
                11: a_g_a = 7'b0001001;
                default: a_g_a = 7'b1111110;
            endcase
            case(digitb)
                0: a_g_b = 7'b1111110;
                1: a_g_b = 7'b0110000;
                2: a_g_b = 7'b1101101;
                3: a_g_b = 7'b1111001;
                4: a_g_b = 7'b0110011;
                5: a_g_b = 7'b1011011;
                6: a_g_b = 7'b1011111;
                7: a_g_b = 7'b1110000;
                8: a_g_b = 7'b1111111;
                9: a_g_b = 7'b1111011;
                10: a_g_b = 7'b1110111;
                11: a_g_b = 7'b0001001;
                default: a_g_b = 7'b1111110;
            endcase
    end
    
endmodule
