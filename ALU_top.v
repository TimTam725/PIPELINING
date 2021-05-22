`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 15:07:37
// Design Name: 
// Module Name: ALU_top
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


module ALU_top(a, b, sm, sa, sb, c_in, op, result, set, ovf);
    input a, b, sm, sa, sb, c_in;
    input [1:0] op;
    output reg result;
    output set, ovf;
    wire A, B, c_out, res;
    
    assign A = (sa)? ~a: a;
    assign B = (sb)? ~b: b;
    assign c_out = (A & B) | (B & c_in) | (c_in & A);
    assign res = A ^ B ^ c_in;
    assign ovf = (c_in != c_out)? 1: 0;
    assign set = (res != ovf)? 1: 0;
    
    always@(a, b, sm, sa, sb, c_in, op) begin
        case(op)
         2'b00 : result <= A & B;
         2'b01 : result <= A | B;
         2'b10 : result <= A ^ B ^ c_in;
         2'b11 : result <= sm;
        default : result <= 0;
        endcase
    end
    
    
    
endmodule
