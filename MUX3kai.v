`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 08:59:19
// Design Name: 
// Module Name: MUX3kai
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


module MUX3kai(F, aluin, wdata, aluout, mux);
    input [1:0] F;
    input [31:0] aluin, wdata, aluout;
    output reg [31:0] mux;
    
    always @(F, aluin, wdata, aluout) begin
        case(F)
            2'b00 : mux <= aluin;
            2'b01 : mux <= wdata;
            2'b10 : mux <= aluout;
            default : mux <= 0; 
        endcase
    end
    
endmodule
