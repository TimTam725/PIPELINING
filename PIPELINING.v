`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/12 11:15:58
// Design Name: 
// Module Name: PIPELINING
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


module PIPELINING(clk);
    input clk;
    //IF
    wire PCSrc, flash;
    wire [31:0] prenextpc, nextpc, pc, jumppc, pcadd4, r_data;
    //ID
    wire [31:0] idpc, idr_data, rdata1, rdata2, extension;
    wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, PCWrite, IF_IDWrite, nop;
    wire [1:0] ALUOp;
    //EX
    wire [1:0] idWB, exWB, ForwardA, ForwardB;
    wire [2:0] idM, exM;
    wire [3:0] idEX, exEX, aluop;
    wire [4:0] mux5in;
    wire [31:0] expc, exrdata1, exrdata2, exextension, Rs, ex2016, ex1511;
    wire [31:0] addressin, aluin2, sin, ALU1, ALU2;
    wire iszeroin;
    //MEM
    wire iszeroout;
    wire [31:0] addressout, sout, wdatamem, rdatamem;
    wire [1:0] memWB;
    wire [2:0] memM;
    wire [4:0] mux5;
    //WB
    wire [1:0] wbWB;
    wire [31:0] wdata0, wdata1, wdata;
    wire [4:0] rw;
   
    //IF
    PC_CTRL_PIPE2 pc_ctrl(PCWrite, nextpc, clk, pc);
    FA32 fa32(pc, 32'd4, pcadd4);
    INST_MEM inst_mem(pc, r_data);
    
    //ID
    IF_ID if_id(flash, IF_IDWrite, clk, pcadd4, r_data, idpc, idr_data);
//    MAIN_CONTROL_pipe main_control_pipe(idr_data[31:26],RegDst,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite);
    MAIN_CONTROL main_control(idr_data[31:26], RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    register_file2 rf2(idr_data[25:21], idr_data[20:16], rw, wdata, wbWB[1], clk, rdata1, rdata2);
    SIGN_EXTENSION sign_extension(idr_data[15:0], extension);
    hazard_detection hd(idr_data[25:21], idr_data[20:16], ex2016, exM[1], PCWrite, IF_IDWrite, nop);
    
    //EX
//    ID_EX id_ex(clk,RegDst,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,idpc,rdata1,rdata2,extension,idr_data[20:16],idr_data[15:11],exWB,exM,exEX,expc,exrdata1,exrdata2,exextension,ex2016,ex1511);
    ID_EX id_ex(PCSrc, clk, idWB, idM, idEX, idpc, rdata1, rdata2, extension, idr_data[25:21], idr_data[20:16], idr_data[15:11], exWB, exM, exEX, expc, exrdata1, exrdata2, exextension, Rs, ex2016, ex1511);
    FA32 fa32pc(expc, exextension << 2, addressin);
    ALU32op aluop32(exEX[2:1], exextension[5:0], aluop);
    ALU32_2 alu32(ALU1, ALU2, aluop, sin, iszeroin);
    MUX3kai alu1res(ForwardA, exrdata1, wdata, sout, ALU1);
    MUX3kai alu2res(ForwardB, exrdata2, wdata, sout, aluin2);
    forwarding_unit fu(Rs, ex2016, mux5, rw, memWB[1], wbWB[1], ForwardA, ForwardB);
//    forwarding_unit(Rs,Rt,ex_memRd,mem_wbRd,ex_memRegWrite,mem_wbRegWrite,ForwardA,ForwardB);
    
    //MEM
    EX_MEM ex_mem(PCSrc, clk, exWB, exM, addressin, iszeroin, sin, aluin2, mux5in, memWB, memM, addressout, iszeroout, sout, wdatamem, mux5);
    DATA_MEM data_mem(sout, wdatamem, memM[0], memM[1], clk, rdatamem);
    
    //WB
    MEM_WB mem_wb(clk, memWB, rdatamem, sout, mux5, wbWB, wdata1, wdata0, rw);
   
    //IF
    assign flash = PCSrc | Jump;
    //ID
    assign jumppc = {idpc[31:28], {idr_data[25:0], 2'b00}};
    assign idWB = (nop)? {RegWrite, MemtoReg}: 0;
    assign idM = (nop)? {Branch, MemRead, MemWrite}: 0;
    assign idEX = (nop)? {RegDst, ALUOp, ALUSrc}: 0;
    //EX
    assign ALU2 = (exEX[0])? exextension: aluin2;
    assign mux5in = (exEX[3])? ex1511: ex2016;
    //MEM
    assign PCSrc = memM[2] & iszeroout;
    //WB
    assign wdata = (wbWB[0])? wdata1: wdata0;
    assign prenextpc = (Jump)? jumppc: pcadd4;
    assign nextpc = (PCSrc)? addressout: prenextpc;
    
endmodule
