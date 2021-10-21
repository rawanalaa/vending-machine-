`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 11:10:21 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(input in , clk ,rst ,output out);
reg Q1 , Q2,Q3;
wire newclk;
divider speed (clk,rst,newclk) ;
always @(posedge newclk)begin 
Q1<=in;
Q2<=Q1;
Q3<=Q2;
end
assign out =(Q1&Q2&Q3);
endmodule
