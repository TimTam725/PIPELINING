`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/05 22:57:08
// Design Name: 
// Module Name: FA32
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


module FA32(a, b, s);
    input [31:0] a, b;
    output [31:0] s;
    wire [30:0] c;
    
    generate
    genvar i;
    for (i = 0; i <= 31; i = i + 1) begin : fa32
        if(i == 0)
            HA ha(a[i], b[i], s[i], c[i]);
        else
            FA fa(a[i], b[i], c[i-1], s[i], c[i]);
    end
    endgenerate

endmodule
