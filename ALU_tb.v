`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 13:05:10
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
    reg a,b,sm,sa,sb,c_in;
    reg [1:0] op;
    wire c_out,result;
   
    ALU alu(a, b, sm, sa, sb, c_in, op, result, c_out);
    initial begin
    //#‚àinitial•¶’†‚Å‚µ‚©Žg‚¦‚È‚¢
        sa=1'b0;
        sb=1'b1;
        a<=1'b1;
        b<=1'b1;
        op<=2'b10;
        c_in<=1'b1;
        #50
        c_in<=1'b1;
        #50
        c_in<=1'b0;
        a<=1'b1;
        b<=1'b0;
        #50
        c_in<=1'b1;
        #50
        c_in<=1'b0;
        a<=1'b1;
        b<=1'b1;
        #50
        c_in<=1'b1;
        #50
        $finish;
    end
endmodule
