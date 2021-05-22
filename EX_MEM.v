`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 18:39:01
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(PCSrc, clk, WBin, Min, aluin1, iszeroin, aluin2, rdata2in, mux5in, WB, M, aluout1, iszero, aluout2, wdata, mux5);
    input clk, PCSrc;
    input [1:0] WBin;
    input [2:0] Min;
    input [31:0] aluin1, aluin2, rdata2in;
    input iszeroin;
    input [4:0] mux5in;
    output reg [1:0] WB;
    output reg [2:0] M;
    output reg [31:0] aluout1, aluout2, wdata;
    output reg iszero;
    output reg [4:0] mux5;
    
    initial begin
        WB <= 0;
        M  <= 0;
        
        aluout1 <= 0;
        aluout2 <= 0;
        iszero  <= 0;
        wdata   <= 0;
        mux5    <= 0;
    end
    
    always @(posedge clk) begin
        WB <= (PCSrc)? 0: WBin;
        M  <= (PCSrc)? 0: Min;
        aluout1 <= aluin1;
        aluout2 <= aluin2;
        iszero  <= iszeroin;
        wdata   <= rdata2in;
        mux5    <= mux5in;
    end
    
endmodule

// case(PCSrc)
//        1'b0 :
//        begin//flash
//            WB <= WBin;
//            M  <= Min;
//            aluout1 <= aluin1;
//            aluout2 <= aluin2;
//            iszero  <= iszeroin;
//            wdata   <= rdata2in;
//            mux5    <= mux5in;
//        end
//        1'b1 :
//        begin
//            WB <= 0;
//            M  <= 0;
//            aluout1 <= aluin1;
//            aluout2 <= aluin2;
//            iszero  <= iszeroin;
//            wdata   <= rdata2in;
//            mux5    <= mux5in;
//        end
//        default :
//        begin
//            WB <= 0;
//            M  <= 0;
//            aluout1 <= 0;
//            aluout2 <= 0;
//            iszero  <= 0;
//            wdata   <= 0;
//            mux5    <= 0;
//        end
//        endcase