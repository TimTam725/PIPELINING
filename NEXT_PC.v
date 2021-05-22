`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 15:07:22
// Design Name: 
// Module Name: NEXT_PC
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


module NEXT_PC(pc,op,Jump,BranchandZero,nextpc,extension);
    input [31:0] pc,op;
    input Jump,BranchandZero;
    output [31:0] nextpc,extension;
    wire [27:0] underjump;
    wire [31:0] fa32_out,jumpad,aluin,branchpc;

    FA32_2 fa32(pc,32'd4,fa32_out);
    SIGN_EXTENSION se(op[15:0],extension);
    BRANCH_ADR ba(fa32_out,extension,BranchandZero,branchpc);
    
    assign underjump={op[25:0],2'b00};
    assign jumpad={fa32_out[31:28],underjump};
    assign nextpc=(Jump)?jumpad:branchpc;
    
endmodule
