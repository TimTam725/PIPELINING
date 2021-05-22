`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 16:11:06
// Design Name: 
// Module Name: SCP
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


module SCP(clk);
    input clk;
    wire [31:0] nextpc,pc,r_data,extension,wdata,rdata1,rdata2,aluin2,aluout,rmdata;
    wire [4:0] rw;
    wire [3:0] aluop;
    wire [1:0] ALUOp;
    wire RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,iszero,BranchandZero;
    
    PC_CTRL pc_ctrl(nextpc,clk,pc);
    INST_MEM inst_mem(pc, r_data);
    NEXT_PC next_pc(pc,r_data,Jump,BranchandZero,nextpc,extension);
    MAIN_CONTROL main_control(r_data[31:26],RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite);
    register_file rf(r_data[25:21],r_data[20:16],rw,wdata,RegWrite,clk,rdata1,rdata2);
    ALU32op alu32op(ALUOp,r_data[5:0],aluop);
    ALU32 alu32(rdata1,aluin2,aluop,aluout,iszero);
    DATA_MEM data_mem(aluout,rdata2,MemWrite,MemRead,clk,rmdata);
    
    assign rw=(RegDst)?r_data[15:11]:r_data[20:16];
    assign aluin2=(ALUSrc)?extension:rdata2;
    assign wdata=(MemtoReg)?rmdata:aluout;
    assign BranchandZero=(Branch&iszero);
    
    
endmodule
