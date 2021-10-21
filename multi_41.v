`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2021 04:27:40 PM
// Design Name: 
// Module Name: multi_41
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


module multi4_1(input [0:6] A,B,C,D,input [0:1] sel,output reg [0:6] Y);
always @(*)
if(sel==2'b00) Y=A;
else if (sel==2'b01) Y=B;
else if (sel==2'b10) Y=C;
else if (sel==2'b11) Y=D;
endmodule
