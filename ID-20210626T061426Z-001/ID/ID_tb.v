`timescale 1ns/1ns
//`include "ID.v"
//`include "control_unit.v"   why is this not allowing me to include things

module ID_tb;

reg clk;
reg [4:0]Ra,Rb,Rd;
reg [31:0]reg_write_data;
reg [6:0]Op;

ID uut(.clk(clk),.Ra(Ra),.Rb(Rb),.Rd(Rd),.reg_write_data(reg_write_data));
control_unit uut2(.clk(clk),.Op(Op));

always #20 clk=~clk;

initial begin
    clk<=1;
    //$dumpfile("ID_tb.vcd");
    //$dumpvars(0,ID_tb);
    Rd<=5'b00010;
    Ra<=5'b00100;
    Rb<=5'b00010;
    Op<=7'b0110011;
    #40
    reg_write_data<=32'b00000000000000000000000011110000;
    Rd<=5'b00010;
    Ra<=5'b00100;
    Rb<=5'b00010;
    Op<=7'b0110011;
    #40
    Rd<=5'b00010;
    Ra<=5'b00100;
    Rb<=5'b00010;
    Op<=7'b0100011;
    #120
    $finish;
end

endmodule