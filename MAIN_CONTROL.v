`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 15:42:54
// Design Name: 
// Module Name: MAIN_CONTROL
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


module MAIN_CONTROL(op, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    input [5:0] op;
    output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    output reg [1:0] ALUOp;
    
    always@(op) begin
        case (op)
            6'b000000: //RŒ`Ž®
            begin
                RegDst   <= 1;
                ALUSrc   <= 0;
                MemtoReg <= 0;
                RegWrite <= 1;
                MemRead  <= 0;
                MemWrite <= 0;
                Branch   <= 0;
                ALUOp    <= 2'b10;
                
                Jump     <= 0;
            end
            
            6'b000100: 
            begin//beq
                RegDst   <= 0;
                ALUSrc   <= 0;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead  <= 0;
                MemWrite <= 0;
                Branch   <= 1;
                ALUOp    <= 2'b01;
                
                Jump     <= 0;
             end
            
            6'b100011: //lw
            begin
                RegDst   <= 0;
                ALUSrc   <= 1;
                MemtoReg <= 1;
                RegWrite <= 1;
                MemRead  <= 1;
                MemWrite <= 0;
                Branch   <= 0;
                ALUOp    <= 2'b00;
                
                Jump     <= 0;
            end
            
            6'b101011: //sw
            begin
                RegDst   <= 0;
                ALUSrc   <= 1;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead  <= 0;
                MemWrite <= 1;
                Branch   <= 0;
                ALUOp    <= 2'b00;
                
                Jump     <= 0;
            end
            
            6'b000010: //Jump
            begin
                RegDst   <= 0;
                ALUSrc   <= 0;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead  <= 0;
                MemWrite <= 0;
                Branch   <= 0;
                ALUOp    <= 2'b00;
                
                Jump     <= 1;
            end
            
            default : 
                begin 
                    RegDst   <= 0;
                    ALUSrc   <= 0;
                    MemtoReg <= 0;
                    RegWrite <= 0;
                    MemRead  <= 0;
                    MemWrite <= 0;
                    Branch   <= 0;
                    ALUOp    <= 2'b00;
                
                    Jump     <= 0;
                end
        endcase
     end
endmodule
