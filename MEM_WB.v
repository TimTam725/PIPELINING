`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/12 10:39:26
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk, WB, rdatain, aluin, mux5in, WBout, rdataout, aluout, mux5);
    input clk;
    input [1:0] WB;
    input [31:0] rdatain, aluin;
    input [4:0] mux5in;
    output reg [1:0] WBout;
    output reg [31:0] rdataout, aluout;
    output reg [4:0] mux5;
    
    initial begin
        WBout    <= 0;
        rdataout <= 0;
        aluout   <= 0;
        mux5     <= 0; 
    end
    
    always @(posedge clk) begin
        WBout    <= WB;
        rdataout <= rdatain;
        aluout   <= aluin;
        mux5     <= mux5in;
    end
    
    
endmodule
