`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 15:51:37
// Design Name: 
// Module Name: ALU32op
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


module ALU32op(ALUOp, funct, aluop);
    input [1:0] ALUOp;
    input [5:0] funct;
    output [3:0] aluop;
    
    assign aluop = aluop2({ALUOp, funct});
    
    function [3:0] aluop2;
	input [7:0] sig;
	   begin
	       casex (sig)
	        8'b00xxxxxx : aluop2 = 4'b0010; 
			8'b01xxxxxx : aluop2 = 4'b0110; 
			8'b1xxx0000 : aluop2 = 4'b0010; 
			8'b1xxx0010 : aluop2 = 4'b0110; 
			8'b1xxx0100 : aluop2 = 4'b0000; 
			8'b1xxx0101 : aluop2 = 4'b0001; 
			8'b1xxx1010 : aluop2 = 4'b0111;
			8'b1xxx0001 : aluop2 = 4'b1000;//èÊéZ
			default : aluop2 = 4'b0000;
	       endcase
	   end
	endfunction
    
endmodule
