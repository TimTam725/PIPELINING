`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 12:04:00
// Design Name: 
// Module Name: PC_CTRL
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


module PC_CTRL(nextpc,clk,pc);
    input clk;
    input [31:0] nextpc;
    output [31:0] pc;
    reg [31:0] pc=32'd0;
    
    always@(posedge clk) begin
        pc<=nextpc;
    end
    
endmodule
