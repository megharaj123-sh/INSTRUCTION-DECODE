`timescale 1ns/1ns
`include "reg_file.v"
`include "control_unit.v"


module ID(clk,Ra,Rb,Rd,reg_write_data,reg_read_data1,reg_read_data2);

input clk;
input [4:0]Ra;
input [4:0]Rb;
input [4:0]Rd;   //right now this Rd is directly being sent to the register file but it should actually be the output of a mux
input [31:0]reg_write_data;  //even this
output [31:0]reg_read_data1;
output [31:0]reg_read_data2;
wire reg_wr;  //control signal

control_unit control_unit(.RegWrite(reg_wr));   //only one control signal to register
reg_file reg_file(.reg_out_1(reg_read_data1),.reg_out_2(reg_read_data2),.reg_addr1(Ra),.reg_addr2(Rb),.reg_write_addr(Rd),.reg_wr(reg_wr),.reg_din(reg_write_data),.clk(clk));

endmodule