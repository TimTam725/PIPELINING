`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 13:36:13
// Design Name: 
// Module Name: ALU32_tb
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


module ALU32_tb;
    reg [31:0] a, b;
    reg [3:0] aluop;
    wire [31:0] s;
    wire iszero;
//    wire ovf, iszero;
    
    ALU32_2 alu32(a, b, aluop, s, iszero);
    
    initial begin
        aluop <= 4'b0000;
        a <= 32'd2;
        b <= 32'd1;
        #50
        aluop<=4'b0001;
//        a<=32'd1;
//        b<=32'd2;
        #50
        aluop<=4'b0010;
//        a<=32'd4;
//        b<=32'd3;
        #50
        aluop<=4'b0110;
//        a<=32'd50;
//        b<=32'd50;
        #50
        aluop<=4'b0111;
//        a<=32'b01000000000000000000000000000000;
//        b<=32'b00000000000000000000000000000000;
        #50
        aluop<=4'b1100;
//        a<=32'b00000000010000000000000000000000;
//        b<=32'b01000010010000000000000000000000;
        #1000
        $finish;
    end
endmodule
