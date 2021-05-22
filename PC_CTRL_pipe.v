`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/12 11:05:56
// Design Name: 
// Module Name: PC_CTRL_pipe
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


module PC_CTRL_pipe(clk,nextpc,pc,pcadd4);
    input clk;
    input [31:0] nextpc;
    output reg [31:0] pc;
    output [31:0] pcadd4;
    
    FA32 fa32(pc,32'b100,pcadd4);
    
    initial begin
        pc<=0;
    end
    
    always @(posedge clk) begin
        pc<=nextpc;
    end
    
endmodule
