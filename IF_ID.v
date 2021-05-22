`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 17:45:18
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(flush, IF_IDWrite, clk, pc, r_data, if_idpc, if_idr_data);
    input clk, IF_IDWrite, flush;
    input [31:0] pc, r_data;
    output reg [31:0] if_idpc, if_idr_data;
    
    initial begin
        if_idpc     <= 32'b0;
        if_idr_data <= 32'b11111100000000000000000000000000;//制御信号が0となるような命令
    end
    
    always @(posedge clk) begin
        if_idpc     <= (IF_IDWrite)? if_idpc: pc;//hazardがあるときはif_idpcを更新しない
        if(flush)
            if_idr_data <= 32'b11111100000000000000000000000000;
        else if(IF_IDWrite == 0)
            if_idr_data <= r_data;
        else
            if_idr_data <= if_idr_data;
//        if_idr_data <= (flush)? 32'b11111100000000000000000000000000: r_data;//flushがあるときはif_idr_dataを制御信号が0となるような命令としてflush
    end
    
endmodule

//        case({IF_IDWrite, flush})
//        2'b00://何もないときはそのまま読み込む
//        begin
//            if_idpc     <= pc;
//            if_idr_data <= r_data;
//        end
//        2'b01://flushの場合
//        begin
//            if_idpc     <= pc;
//            if_idr_data <= 32'b11111100000000000000000000000000;//制御信号が0となるような命令
//        end
//        2'b10://hazardの場合
//        begin
//            if_idr_data <= 32'b11111100000000000000000000000000;//
//        end
//        default:
//        begin
//            if_idpc     <= 0;
//            if_idr_data <= 32'b11111100000000000000000000000000;
//        end
//        endcase