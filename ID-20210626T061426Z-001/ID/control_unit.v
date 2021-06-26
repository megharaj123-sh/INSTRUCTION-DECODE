`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2021 13:31:16
// Design Name: 
// Module Name: control_unit
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


module control_unit(clk,Op,RegDst,RegWrite,ALUOp,MemRead,MemWrite,MemtoReg,Branch,ALUSrc);

input clk;
input [5:0]Op;  // instruction[31:26]

output reg RegDst;
output reg RegWrite;
output reg [1:0] ALUOp;
output reg MemRead;
output reg MemWrite;
output reg MemtoReg;
output reg Branch; //later used to compute PCSrc
output reg ALUSrc;

always @(negedge clk)
begin
    case(Op)
        6'b000000: //R format
            begin
            RegDst<=1;
            RegWrite<=1;
            ALUOp<=2'b10;
            MemRead<=0;
            MemWrite<=0;
            MemtoReg<=0;
            Branch<=0;  
            ALUSrc<=0;
            end
        6'b100011: //lw format
            begin
            RegDst<=0;
            RegWrite<=1;
            ALUOp<=2'b00;
            MemRead<=1;
            MemWrite<=0;
            MemtoReg<=1;
            Branch<=0;  
            ALUSrc<=1;
            end
         6'b101011: //sw format
            begin
            RegDst<=1'bx;
            RegWrite<=0;
            ALUOp<=2'b00;
            MemRead<=0;
            MemWrite<=1;
            MemtoReg<=1'bx;
            Branch<=0;  
            ALUSrc<=1; 
            end
        6'b000100: //beq format
            begin
            RegDst<=1'bx;
            RegWrite<=0;
            ALUOp<=2'b01;
            MemRead<=0;
            MemWrite<=0;
            MemtoReg<=1'bx;
            Branch<=1;  
            ALUSrc<=0; 
            end 
         default:
            begin
            RegDst<=1'bx;
            RegWrite<=1'bx;
            ALUOp<=2'bxx;
            MemRead<=1'bx;
            MemWrite<=1'bx;
            MemtoReg<=1'bx;
            Branch<=1'bx;  
            ALUSrc<=1'bx; 
            end
               
     endcase

end

endmodule
