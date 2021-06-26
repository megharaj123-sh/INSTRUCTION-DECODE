`timescale 1ns / 1ns
`include "reg_file.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2021 23:37:26
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb;
wire [31:0] reg_out_1;
wire [31:0] reg_out_2;
reg [4:0] reg_addr1;
reg [4:0] reg_addr2;
reg [4:0] reg_write_addr;
reg [31:0] reg_din;
reg reg_wr;
reg clk;

reg_file uut(.reg_out_1(reg_out_1),.reg_out_2(reg_out_2),.reg_addr1(reg_addr1),.reg_addr2(reg_addr2),.reg_write_addr(reg_write_addr),.reg_wr(reg_wr),.reg_din(reg_din),.clk(clk));

always #20 clk=~clk;

initial begin
    clk<=1;
    //$dumpfile("reg_file_tb.vcd");
    //$dumpvars(0,reg_file_tb);
    reg_wr<=1;
    reg_write_addr<=5'b00010;
    reg_din<=32'b00000000000000000000000011110000;
    
    #40;
    reg_wr<=1;
    reg_write_addr<=5'b00100;
    reg_din<=32'b00000000000000000000000000001111;
    
    #80;
    reg_wr<=0;
    reg_addr1<=5'b00010;
    reg_addr2<=5'b00100;
    
    #120;
    $finish;   
    end
endmodule
