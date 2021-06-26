`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2021 09:14:05
// Design Name: 
// Module Name: reg_file
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


    //Updates
    //1)added an address field for writing the data into the register like Rd;
	//2)changed the size of registers (previously it was 6)
module reg_file(reg_out_1,reg_out_2,reg_addr1,reg_addr2,reg_write_addr,reg_wr,reg_din,clk);
	input [4:0] reg_addr1,reg_addr2,reg_write_addr;
	input [31:0] reg_din;
	input reg_wr,clk;
	output reg [31:0] reg_out_1,reg_out_2;
	reg [31:0] registers [31:0];
	initial
		{reg_out_1,reg_out_2} = {32{1'b0}};
	always @(negedge clk)
			
			case(reg_wr)
				1'b0:
					begin
						
						reg_out_1 <= registers[reg_addr1];
						reg_out_2 <= registers[reg_addr2];
							
					end
				1'b1:
					begin
						
						registers[reg_write_addr] <= reg_din; //changed this from register[reg_addr1]<=reg_din;
							
					end
			endcase
	


endmodule