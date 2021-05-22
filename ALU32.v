`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 10:51:18
// Design Name: 
// Module Name: ALU32
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


module ALU32(a, b, aluop, s, iszero);
    input [31:0] a, b;
    input [3:0] aluop;
    output [31:0] s;
    output iszero;
    wire [30:0] c;
    wire [31:0] d, d2;
    wire set, zero;
    
    generate
    genvar i;
    for(i = 0; i <= 31; i = i + 1) begin: alu32
        if(i == 0)
            ALU alud(a[i], b[i], set, aluop[3], aluop[2], aluop[2], aluop[1:0], d[i], c[i]);//Œ¸ŽZ‚ðs‚¤Žž‚Íb‚Ì”½“]M†sb‚ÆÅ‰ºˆÊbit‚Ìc_in‚ª1‚É‚È‚é
        else if(i == 31)
            ALU_top alut(a[i], b[i], 0, aluop[3], aluop[2], c[i-1], aluop[1:0], d[i], set,);//ovf‚Í‚È‚µ‚Æ‚µ‚½
        else
            ALU alu(a[i], b[i], 0, aluop[3], aluop[2], c[i-1], aluop[1:0], d[i], c[i]);
    end
    endgenerate
    
    assign iszero =~|s;
    
    RCAres rca(a[15:0], b[15:0], d2);
//    CSAres csa(a[15:0], b[15:0], d2);
//    Wallace_Tree WT(a[15:0], b[15:0], d2);
    
    assign s = (aluop == 4'b1000)? d2: d; 
    
endmodule
