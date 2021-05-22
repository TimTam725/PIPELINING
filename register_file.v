`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 16:35:59
// Design Name: 
// Module Name: register_file
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


module register_file(rs,rt,rw,wdata,RegWrite,clk,rdata1,rdata2);
    input [4:0] rs,rt,rw;
    input [31:0] wdata;
    input RegWrite;
    input clk;
    output [31:0] rdata1,rdata2;
    reg [31:0] register [31:0];
    
    assign rdata1=register[rs];
    assign rdata2=register[rt];
    
    integer i;
    initial begin
        for(i=0;i<=31;i=i+1) begin
		  register[i] <= 32'b0;
		end
    end
    
    always@(posedge clk) begin
        if(RegWrite)
            register[rw]<=wdata;
    end
    
endmodule
