`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 16:01:47
// Design Name: 
// Module Name: hazard_detection
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


module hazard_detection(r_data2521, r_data2016, Rt, id_exMemRead, PCWrite, IF_IDWrite, nop);
    input [4:0] r_data2521, r_data2016,Rt;
    input id_exMemRead;
    output PCWrite, IF_IDWrite, nop;
    
    assign nop = (id_exMemRead & ((Rt == r_data2521) | (Rt == r_data2016)))? 0: 1;
    assign PCWrite = ~nop;
    assign IF_IDWrite = ~nop;
    
endmodule
