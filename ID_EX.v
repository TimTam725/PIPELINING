`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 17:57:50
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(PCSrc, clk, idWB, idM, idEX, pc, rdata1, rdata2, extension, r_data2521, r_data2016, r_data1511, WB, M, EX, pc2, rdata12, rdata22, extension2, r_data25212, r_data20162, r_data15112);
    input clk, PCSrc;
    input [1:0] idWB;
    input [2:0] idM;
    input [3:0] idEX;
    input [31:0] pc, rdata1, rdata2, extension;
    input [4:0] r_data2521, r_data2016, r_data1511;
    output reg [1:0] WB;
    output reg [2:0] M;
    output reg [3:0] EX;
    output reg [31:0] pc2, rdata12, rdata22, extension2;
    output reg [4:0] r_data25212, r_data20162, r_data15112;
    
    initial begin
        WB <= 0;
        M  <= 0;
        EX <= 0;
        
        pc2         <= 0;
        rdata12     <= 0;
        rdata22     <= 0;
        extension2  <= 0;
        r_data25212 <= 0;
        r_data20162 <= 0;
        r_data15112 <= 0;
    end
    
    always @(posedge clk) begin
//        WB <= {RegWrite,MemtoReg};
//        M  <= {Branch,MemRead,MemWrite};
//        EX <= {RegDst,ALUOp,ALUSrc};
        WB <= (PCSrc)? 0: idWB;
        M  <= (PCSrc)? 0: idM;
        EX <= (PCSrc)? 0: idEX;
        pc2         <= pc;
        rdata12     <= rdata1;
        rdata22     <= rdata2;
        extension2  <= extension;
        r_data25212 <= r_data2521;
        r_data20162 <= r_data2016;
        r_data15112 <= r_data1511;
    end
     
endmodule

//        case(PCSrc)
//        1'b0:
//        begin//flash
//            WB <= idWB;
//            M  <= idM;
//            EX <= idEX;
//            pc2         <= pc;
//            rdata12     <= rdata1;
//            rdata22     <= rdata2;
//            extension2  <= extension;
//            r_data25212 <= r_data2521;
//            r_data20162 <= r_data2016;
//            r_data15112 <= r_data1511;
//        end
//        1'b1:
//        begin
//            WB <= 0;
//            M  <= 0;
//            EX <= 0;
//            pc2         <= pc;
//            rdata12     <= rdata1;
//            rdata22     <= rdata2;
//            extension2  <= extension;
//            r_data25212 <= r_data2521;
//            r_data20162 <= r_data2016;
//            r_data15112 <= r_data1511;
//        end
//        default:
//        begin
//            WB <= 0;
//            M  <= 0;
//            EX <= 0;
//            pc2         <= 0;
//            rdata12     <= 0;
//            rdata22     <= 0;
//            extension2  <= 0;
//            r_data25212 <= 0;
//            r_data20162 <= 0;
//            r_data15112 <= 0;
//        end
//        endcase
