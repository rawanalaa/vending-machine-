`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:34:30 AM
// Design Name: 
// Module Name: vendStates
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


module vendStates(input clk, rst, p, n, d, s , output reg [3:0] change ,output reg  vend, output reg [4:0] total);
reg [4:0] state, nextstate;
reg c1,r; 
wire speed;
parameter [4:0] zero= 5'b00000, one=5'b00001, two=5'b00010, three=5'b00011,four=5'b00100,five=5'b00101,six=5'b00110,seven=5'b00111,eight=5'b01000,nine=5'b01001,ten=5'b01010,eleven=5'b01011,twelve=5'b01100,thirteen=5'b01101,fourteen=5'b01110,fifteen=5'b01111,sixteen=5'b10000,seventeen=5'b10001,eighteen=5'b10010,nineteen=5'b10011,twenty=5'b10100, twentyone=5'b10101, twentytwo=5'b10110,twentythree=5'b10111, twentyfour=5'b11000, twentyfive=5'b11001,twentysix=5'b11010, twentyseven=5'b11011,twentyeight=5'b11100,twentynine=5'b11101;
divider #(50000000) ( clk,rst,speed);
always @(posedge speed) begin 
if ( p || n || d || s) begin
c1=0;
r=0;
end
 else if ( c1== 30) begin
r=1'b1;
c1=0; end
else begin c1<=c1+1; r=0; end
end
always @(state or p or n or d) begin
vend=1'b0;
case (state) 
zero: begin
vend=1'b0;
total=5'b00000; 
if (p) nextstate=one;
else if(n) nextstate=five; 
else if (d) nextstate=ten; 
else nextstate=zero;
end
one: begin
total=5'b00001;
if (p) nextstate=two; 
else if(n) nextstate=six;
else if (d) nextstate=eleven; 
else nextstate=one;
end
two: begin
vend=1'b0;
total=5'b00010;
if (p) nextstate=three; 
else if (n) nextstate=seven;
else if (d) nextstate=twelve; 
else nextstate=two;
end
three: begin
//vend=1'b0;
total=5'b00011;
if(p) nextstate=four; 
else if (n) nextstate=eight;
else if (d) nextstate=thirteen;
else nextstate=three;
end
four: begin 
//vend=1'b0;
total = 5'b00100;
if (p)nextstate=five;
else if (n) nextstate=nine; 
else if (d) nextstate=fourteen;
else nextstate=four;

end
five: begin 
//vend=1'b0;
total=5'b00101;
if (p) nextstate=six;
else if (n) nextstate=ten;
else if (d) nextstate=fifteen;
else  nextstate=five;
end
six: begin
total=5'b00110;
//vend=1'b0;
if (p) nextstate=seven;
else if (n) nextstate=eleven; 
else if (d) nextstate=sixteen;
else nextstate=six;
end
seven: 
begin 
total= 5'b00111; 
//vend=1'b0;
if (p) nextstate=eight;   
else if (n) nextstate=twelve;
else if (d) nextstate=seventeen; 
else nextstate=seven;
end
eight: begin
total=5'b01000;
if (p) nextstate=nine;       
else if (n) nextstate=thirteen;  
else if (d) nextstate=eighteen;
else nextstate=eight;
end
nine:  begin
total= 5'b01001; 
if (p) nextstate=ten;           
else if (n) nextstate=fourteen; 
else if (d) nextstate=nineteen;
else nextstate=nine;
end
ten: begin 
total=5'b01010;
if (p) nextstate=eleven; 
else if (n) nextstate=fifteen; 
else if (d) nextstate=twenty;
else nextstate=ten;
end
eleven: begin 
total= 5'b01011;
if(p) nextstate=twelve; 
else if (n)  nextstate=sixteen;
else if (d) nextstate=twentyone;
else nextstate=eleven;
end
twelve: begin
total=5'b01100; 
if (p) nextstate=thirteen;   
else if (n) nextstate=seventeen;
else if (d)nextstate=twentytwo;
else nextstate=twelve;
end
thirteen: begin
total=5'b01101;
if (p) nextstate=fourteen;
else if (n)nextstate=eighteen;
else if (d) nextstate=twentythree;
else nextstate=thirteen;
end
fourteen: begin 
total= 5'b01110; 
if (p) nextstate=fifteen;   
else if (n) nextstate=nineteen;
else if (d) nextstate=twentyfour;
else nextstate=fourteen;
end
fifteen: begin 
total= 5'b01111;
if (p) nextstate=sixteen; 
else if (n) nextstate=twenty; 
else if (d) nextstate=twentyfive;
else nextstate=fifteen;
end
sixteen: begin
total=5'b10000;
if (p) nextstate=seventeen; 
else if (n) nextstate=twentyone;
else if(d) nextstate=twentysix;
else nextstate=sixteen;
end
seventeen: begin 
total= 5'b10001; 
if (p) nextstate=eighteen; 
else if(n) nextstate=twentytwo;
else if (d) nextstate=twentyseven;
else nextstate=seventeen;
end
eighteen: begin
total=5'b10010;
if(p) nextstate=nineteen; 
else if (n)  nextstate=twentythree;
else if (d) nextstate=twentyeight;
else nextstate=eighteen;
end
nineteen: begin 
total=5'b10011; 
if (p) nextstate=twenty; 
else if (n)nextstate=twentyfour;
else if (d) nextstate=twentynine;
else nextstate=nineteen;
end
twenty: begin
 total = 5'b10100;
 nextstate=twenty; 
 vend=1'b1; 
 end
twentyone: begin total = 5'b00001;  vend=1'b1;  nextstate= twentyone; 
end
twentytwo: begin total = 5'b00010; nextstate=twentytwo; vend=1'b1;
 end
twentythree: begin total = 5'b00011; nextstate=twentythree; vend=1'b1;
 end
twentyfour: begin total = 5'b00100; nextstate=twentyfour; vend=1'b1; 
end
twentyfive: begin total = 5'b00101; nextstate=twentyfive; vend=1'b1;
 end
twentysix:begin total = 5'b00110; nextstate=twentysix;  vend=1'b1;
 end
twentyseven:begin total = 5'b00111; nextstate=twentyseven;  vend=1'b1;
 end
twentyeight:begin total = 5'b01000; nextstate=twentyeight;  vend=1'b1;
 end
twentynine:begin total = 5'b01001; nextstate=twentynine;  vend=1'b1; 
end
default: nextstate=zero;
endcase
end
always @(posedge clk )begin
if(rst)begin
state <= zero;
end
else begin 
state <= nextstate;
end
end
endmodule
