`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2025 10:52:08
// Design Name: 
// Module Name: tb_eg3
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


module tb_eg3;
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
    $readmemb("C:/Users/arn19/OneDrive/Desktop/VLSI/Verilog/MIPS/MIPS.srcs/sim_1/new/mem.h", mp.Mem);
    mp.HALTED=0;
    mp.PC=0;
    mp.TAKE_BRANCH=0;
     #1000
     $display("Mem[0] = %b", mp.Mem[0]);
    $display("Mem[1] = %b", mp.Mem[1]);
    $display("Mem[2] = %b", mp.Mem[2]);
    for(k=0;k<7;k=k+1)
    $display("R%1d - %2d",k,mp.Reg[k]);
    end
    initial
    begin
    #5000 $finish;
    end
endmodule
