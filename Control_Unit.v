module Control_Unit(opcode , Branch, Jump , ImmSrc , ResultSrc , ALUOp , MemWrite , ALUSrc , RegWrite);
input [6:0] opcode;
output reg Branch , Jump , MemWrite , ALUSrc , RegWrite;
output reg [1:0] ImmSrc , ALUOp ,  ResultSrc;
always @(*) begin 
case (opcode)
7'b0110011 : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'b0_00_xx_1_0_0_10_0;
7'b0000011 : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'b1_01_00_1_0_0_00_0;
7'b0100011 : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'b1_xx_01_0_1_0_00_0;
7'b1100011 : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'b0_xx_10_0_0_1_01_0;
7'b0010011 : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'b1_00_00_1_0_0_10_0;
7'b1101111 : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'bx_10_11_1_0_0_xx_1;
default    : {ALUSrc , ResultSrc , ImmSrc , RegWrite , MemWrite , Branch , ALUOp , Jump} = 11'bx_xx_xx_x_x_x_xx_x;
endcase
end
endmodule
