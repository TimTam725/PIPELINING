`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 03:09:51
// Design Name: 
// Module Name: MUX3
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


module MUX3(F,aluin,wdata,aluout,mux);
    input [1:0] F;
    input [31:0] aluin,wdata,aluout;
    output [31:0] mux;
    
    assign mux=premux(F);
    
    function [31:0] premux;
	input [1:0] f;
	   begin
	       case (f)
	        2'b00 : premux=aluin;
	        2'b01 : premux=wdata;
	        2'b10 : premux=aluout;
			default : premux=32'b0;
	       endcase
	   end
	endfunction
    
endmodule
