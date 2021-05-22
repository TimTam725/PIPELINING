`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/10 12:27:06
// Design Name: 
// Module Name: DATA_MEM
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


module DATA_MEM(r_address, w_data, MemWrite, MemRead, clk, r_data);
    input  [31:0] r_address, w_data;
    input MemWrite, MemRead, clk;
    output [31:0] r_data;
    reg [31:0] data_mem [31:0]; 
    
    integer i;
    initial begin
        for (i = 4; i <= 31 ; i = i + 1) begin
				data_mem[i] <= 0;
        end
//        data_mem[0] <= 0;
//        data_mem[1] <= 32'd2;
//        data_mem[2] <= 32'd3;
//        data_mem[3] <= 0;
        data_mem[0] <= 0;
        data_mem[1] <= 32'd1;
        data_mem[2] <= 32'd11;
        data_mem[3] <= 0;
    end
    
    assign r_data = (MemRead)? data_mem[r_address]: 0;
    
    always@(posedge clk) begin
        if(MemWrite) begin
            data_mem[r_address] <= w_data;
        end
    end
    
endmodule
