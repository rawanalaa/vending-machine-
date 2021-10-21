`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 10:20:35 PM
// Design Name: 
// Module Name: VendingMachine
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
//module vendStates(input clk, rst, p, n, d, s ,  ,output reg  vend, );


module VendingMachine(input clk , RxD, output [0:6] seg, output [0:3] enable,output reg  vend);
reg [4:0] total ;
  reg [3:0] change;
wire rst,p,n,d,s;
UART #(8'b01110010) reset(.clk(clk), .RxD(RxD), .RxData(), .output_level(rst));
UART #(8'b01110000) penny(.clk(clk), .RxD(RxD), .RxData(), .output_level(p));
UART #(8'b01101111) nickle(.clk(clk), .RxD(RxD), .RxData(), .output_level(n));
UART #(8'b01100100) dime(.clk(clk), .RxD(RxD), .RxData(), .output_level(d)); 
UART #(8'b01110011) stop(.clk(clk), .RxD(RxD), .RxData(), .output_level(s)); 

//reg count=0; wire c2;
//divider #(50000000) c1 (.clk(clk),.rst(rst),.clk_out(c2));
wire p1,n1,d1, s1;
Synchronizer synchro_p(.clk(clk),.in(p),.out(p1));
Synchronizer synchro_n(.clk(clk),.in(n),.out(n1));
Synchronizer synchro_d(.clk(clk),.in(d),.out(d1));
Synchronizer synchro_s(.clk(clk),.in(s),.out(s1));
wire p2,n2,d2,s2;
debouncer de_p(.in(p1),.clk(clk),.rst(rst),.out(p2));
debouncer de_n(.in(n1),.clk(clk),.rst(rst),.out(n2));
debouncer de_d(.in(d1),.clk(clk),.rst(rst),.out(d2));
debouncer de_s(.in(s1),.clk(clk),.rst(rst),.out(s2));
wire P,N,D,S;
edgeDetector edge_p(.clk(clk),.rst(rst),.level(p2),.tick(P));
edgeDetector edge_n(.clk(clk),.rst(rst),.level(n2),.tick(N));
edgeDetector edge_d(.clk(clk),.rst(rst),.level(d2),.tick(D));
edgeDetector edge_s(.clk(clk),.rst(rst),.level(s2),.tick(S));
//wire[3:0]change;
//wire [4:0] total;

reg [4:0] state, nextstate;
reg [4:0] c1;
reg r; 
wire speed1;
parameter [4:0] zero= 5'b00000, one=5'b00001, two=5'b00010, three=5'b00011,four=5'b00100,five=5'b00101,six=5'b00110,seven=5'b00111,eight=5'b01000,nine=5'b01001,ten=5'b01010,eleven=5'b01011,twelve=5'b01100,thirteen=5'b01101,fourteen=5'b01110,fifteen=5'b01111,sixteen=5'b10000,seventeen=5'b10001,eighteen=5'b10010,nineteen=5'b10011,twenty=5'b10100, twentyone=5'b10101, twentytwo=5'b10110,twentythree=5'b10111, twentyfour=5'b11000, twentyfive=5'b11001,twentysix=5'b11010, twentyseven=5'b11011,twentyeight=5'b11100,twentynine=5'b11101;
divider #(50000000) ( clk,rst,speed1);
always @(posedge speed1) begin 
if ( p || n || d || s) begin
c1=0;
r=0;
end
 else if ( c1== 5'b11110) begin
r=1'b1;
c1=0;
 end
else begin c1<=c1+1; r=0; end
end
always @(state or P or N or D ) begin
vend=1'b0;
case (state) 
zero: begin
vend=1'b0;
total=5'b00000; 
if (P) nextstate=one;
else if(N) nextstate=five; 
else if (D) nextstate=ten; 
else nextstate=zero;
end
one: begin
total=5'b00001;
if (P) nextstate=two; 
else if(N) nextstate=six;
else if (D) nextstate=eleven; 
else nextstate=one;
end
two: begin
vend=1'b0;
total=5'b00010;
if (P) nextstate=three; 
else if (N) nextstate=seven;
else if (D) nextstate=twelve; 
else nextstate=two;
end
three: begin
//vend=1'b0;
total=5'b00011;
if(P) nextstate=four; 
else if (N) nextstate=eight;
else if (D) nextstate=thirteen;
else nextstate=three;
end
four: begin 
//vend=1'b0;
total = 5'b00100;
if (P)nextstate=five;
else if (N) nextstate=nine; 
else if (D) nextstate=fourteen;
else nextstate=four;

end
five: begin 
//vend=1'b0;
total=5'b00101;
if (P) nextstate=six;
else if (N) nextstate=ten;
else if (D) nextstate=fifteen;
else  nextstate=five;
end
six: begin
total=5'b00110;
//vend=1'b0;
if (P) nextstate=seven;
else if (N) nextstate=eleven; 
else if (D) nextstate=sixteen;
else nextstate=six;
end
seven: 
begin 
total= 5'b00111; 
//vend=1'b0;
if (P) nextstate=eight;   
else if (N) nextstate=twelve;
else if (D) nextstate=seventeen; 
else nextstate=seven;
end
eight: begin
total=5'b01000;
if (P) nextstate=nine;       
else if (N) nextstate=thirteen;  
else if (D) nextstate=eighteen;
else nextstate=eight;
end
nine:  begin
total= 5'b01001; 
if (P) nextstate=ten;           
else if (N) nextstate=fourteen; 
else if (D) nextstate=nineteen;
else nextstate=nine;
end
ten: begin 
total=5'b01010;
if (P) nextstate=eleven; 
else if (N) nextstate=fifteen; 
else if (D) nextstate=twenty;
else nextstate=ten;
end
eleven: begin 
total= 5'b01011;
if(P) nextstate=twelve; 
else if (N)  nextstate=sixteen;
else if (D) nextstate=twentyone;
else nextstate=eleven;
end
twelve: begin
total=5'b01100; 
if (P) nextstate=thirteen;   
else if (N) nextstate=seventeen;
else if (D)nextstate=twentytwo;
else nextstate=twelve;
end
thirteen: begin
total=5'b01101;
if (P) nextstate=fourteen;
else if (N)nextstate=eighteen;
else if (D) nextstate=twentythree;
else nextstate=thirteen;
end
fourteen: begin 
total= 5'b01110; 
if (P) nextstate=fifteen;   
else if (N) nextstate=nineteen;
else if (D) nextstate=twentyfour;
else nextstate=fourteen;
end
fifteen: begin 
total= 5'b01111;
if (P) nextstate=sixteen; 
else if (N) nextstate=twenty; 
else if (D) nextstate=twentyfive;
else nextstate=fifteen;
end
sixteen: begin
total=5'b10000;
if (P) nextstate=seventeen; 
else if (N) nextstate=twentyone;
else if(D) nextstate=twentysix;
else nextstate=sixteen;
end
seventeen: begin 
total= 5'b10001; 
if (P) nextstate=eighteen; 
else if(N) nextstate=twentytwo;
else if (D) nextstate=twentyseven;
else nextstate=seventeen;
end
eighteen: begin
total=5'b10010;
if(P) nextstate=nineteen; 
else if (N)  nextstate=twentythree;
else if (D) nextstate=twentyeight;
else nextstate=eighteen;
end
nineteen: begin 
total=5'b10011; 
if (P) nextstate=twenty; 
else if (N)nextstate=twentyfour;
else if (D) nextstate=twentynine;
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
if(s && vend)begin
state <= state -20;
end
else begin 
state <= nextstate;
end
if (r ==1) begin
state <= zero;
end
end
wire speed ;
wire [3:0] ten1,one1;
BCD bcd(.binary(total), .tens(ten1), .ones(one1));

wire [0:6] seg1,seg2,seg3;
segments segm1 (.digit(one1),.LED_out(seg1));
segments segm2 (.digit(ten1),.LED_out(seg2));
segments segm3 (.digit(change),.LED_out(seg3));

divider #(500000) control(.clk(clk),.rst(rst),.clk_out(speed));

 wire [1:0] binarycount;
 bitcount selectors (0,0, speed, rst, binarycount);
 multi4_1 segment(.A(seg1),.B(seg2),.sel(binarycount),.Y(seg));
 decoder en(.in(binarycount),.Y(enable));
endmodule
