`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 14:21:24
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(Rs, Rt, ex_memRd, mem_wbRd, ex_memRegWrite, mem_wbRegWrite, ForwardA, ForwardB);
    input [4:0] Rs, Rt, ex_memRd, mem_wbRd;
    input ex_memRegWrite, mem_wbRegWrite;
    output [1:0] ForwardA, ForwardB;
    wire [1:0] preA, preB;
    
    //EXhazard
    assign preA = (ex_memRegWrite & (ex_memRd != 0) & (ex_memRd == Rs))? 2'b10: 0;
    assign preB = (ex_memRegWrite & (ex_memRd != 0) & (ex_memRd == Rt))? 2'b10: 0;
    
    //MEMhazard
    assign ForwardA = (mem_wbRegWrite & (mem_wbRd != 0) & ~(ex_memRegWrite & (ex_memRd != 0) & (ex_memRd == Rs)) & (mem_wbRd == Rs))? 2'b01: preA;
    assign ForwardB = (mem_wbRegWrite & (mem_wbRd != 0) & ~(ex_memRegWrite & (ex_memRd != 0) & (ex_memRd == Rt)) & (mem_wbRd == Rt))? 2'b01: preB;
    
endmodule
