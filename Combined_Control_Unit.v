module CU(opcode , Funct3 , Funct7 , ResultSrc , MemWrite , ALUSrc , ImmSrc , RegWrite , Operation , Branch , Jump);
input [6:0] opcode ,Funct7;
input [2:0] Funct3;
output  MemWrite , ALUSrc , RegWrite;
output  [1:0] ImmSrc , ResultSrc;
output  [2:0] Operation;
output Branch , Jump;
wire [1:0] ALUOp;
Control_Unit c(opcode , Branch , Jump , ImmSrc , ResultSrc , ALUOp , MemWrite , ALUSrc , RegWrite);
ALU_Control  a(ALUOp , Funct3 , Funct7[5] , opcode[5] , Operation);
endmodule
