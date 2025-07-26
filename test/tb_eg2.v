`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2025 00:04:11
// Design Name: 
// Module Name: tb_eg2
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


module tb_eg2;
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
    mp.Mem[0]=32'h28010078;
    mp.Mem[1]=32'h0cc77800;
    mp.Mem[2]=32'h20220000;
    mp.Mem[3]=32'h0cc77800;
    mp.Mem[4]=32'h2842002D;
    mp.Mem[5]=32'h0cc77800;
    mp.Mem[6]=32'h24220001;
    mp.Mem[7]=32'h0cc77800;
    mp.Mem[8]=32'hFC000000;
    mp.Mem[120]=20;
    mp.HALTED=0;
    mp.PC=0;
    mp.TAKE_BRANCH=0;
    #280
    $display("R[120]",mp.Mem[120]);
    $display("R[121]",mp.Mem[121]);
    end
   initial
    begin
    #300 $finish;
    end
endmodule
