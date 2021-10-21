`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2021 04:23:27 PM
// Design Name: 
// Module Name: bitcount
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


module bitcount #(parameter n=2)(input upDown , Inc,clk , rst , output reg [n-1:0] counter);
always @(posedge clk, posedge rst) begin
 if (rst == 1)begin 
 counter <= 3'd0; // non blocking assignment
 end
 else begin
    if (upDown ==0 ) begin 
            if(Inc==0)begin 
                    counter <= counter + 1; // non blocking assignment
                     end
            else begin
                    counter <= counter + 2;
                      end
    end
    else begin 
        if(Inc==0)begin 
                counter <= counter - 1; // non blocking assignment
        end
        else begin
                counter <= counter - 2;
        end
    end
end
end
endmodule



/*module bitcount (input clk  ,rst, output reg[0:1] counter);
always @(posedge clk, posedge rst) begin
if(rst==1) counter<=0;
      else
      counter <= counter + 1; // non blocking assignment
end
endmodule*/
