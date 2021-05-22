`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 14:45:59
// Design Name: 
// Module Name: BRANCH_ADR
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


module BRANCH_ADR(pc,extension,BranchandZero,branchpc);
    input [31:0] pc,extension;
    input BranchandZero;
    output [31:0] branchpc;
    wire [31:0] bpc2,aluout;
    
    FA32 fa32(pc,bpc2,aluout);
    
    assign bpc2 = extension <<2 ;
    assign branchpc=(BranchandZero)?aluout:pc;
    
endmodule
