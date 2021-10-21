`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2021 04:30:36 PM
// Design Name: 
// Module Name: decoder
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


module decoder(input [0:1] in , output reg [0:3] Y);

always @(*)begin
case(in)
2'b11 : begin Y[0]=0 ; Y[1]=1 ; Y[2]=1; Y[3]=1; end
2'b10: begin Y[0]=1 ; Y[1]=0 ; Y[2]=1; Y[3]=1; end
2'b01 : begin Y[0]=1 ; Y[1]=1 ; Y[2]=0; Y[3]=1; end
2'b00 : begin Y[0]=1 ; Y[1]=1 ; Y[2]=1; Y[3]=0; end
endcase
end
endmodule

