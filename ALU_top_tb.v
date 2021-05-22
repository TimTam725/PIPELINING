`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 14:21:46
// Design Name: 
// Module Name: ALU_top_tb
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


module ALU_top_tb;
    reg a,b,sm,sa,sb,c_in;
    reg [1:0] op;
    wire result,set,ovf;
    ALU_top alu_top(a,b,sm,sa,sb,c_in,op,result,set,ovf);
    
    initial begin
        a<=1'b0;
        b<=1'b0;
        sm<=1'b0;
        sa<=1'b0;
        sb<=1'b0;
        c_in<=1'b0;
        op<=2'd3;
        #50
        a<=1'b0;
        b<=1'b1;
        c_in<=1'b0;
        #50
        a<=1'b0;
        b<=1'b1;
        c_in<=1'b1;
        #50
        a<=1'b1;
        b<=1'b1;
        c_in<=1'b0;
        #50
        a<=1'b1;
        b<=1'b1;
        c_in<=1'b1;
        #100
        $finish;
    end
endmodule
