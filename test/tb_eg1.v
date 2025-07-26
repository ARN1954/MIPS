`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2025 22:45:34
// Design Name: 
// Module Name: tb_eg1
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


module tb_eg1;
reg clk1,clk2;
integer k;
mips mp(clk1,clk2);
initial 
    begin
        clk1=0;clk2=0;
        repeat(20)
        begin
        #5 clk1=1; #5 clk1=0;
        #5 clk2=1; #5 clk2=0; 
        end      
    end
initial
    begin
    for (k=0;k<31;k=k+1)
    mp.Reg[k]=k;
    mp.Mem[0]=32'h2801000A;
    mp.Mem[1]=32'h28020014;
    mp.Mem[2]=32'h28030019;
    mp.Mem[3]=32'h0cc77800;
    mp.Mem[4]=32'h0cc77800;
    mp.Mem[5]=32'h00222000;
    mp.Mem[6]=32'h0cc77800;
    mp.Mem[7]=32'h00832800;
    mp.Mem[8]=32'hFC000000;
    mp.HALTED=0;
    mp.PC=0;
    mp.TAKE_BRANCH=0;
    #280
    for(k=0;k<6;k=k+1)
    $display("R%1d - %2d",k,mp.Reg[k]);
    end
    initial
    begin
    #300 $finish;
    end
    
    
endmodule
