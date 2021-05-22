`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 12:55:46
// Design Name: 
// Module Name: SIGN_EXTENSION
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


module SIGN_EXTENSION(sign16, sign32);
    input [15:0] sign16;
    output [31:0] sign32;
    
    assign sign32 = sign16;
    
endmodule
