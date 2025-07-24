module Pipe_D(clk , Instruction_F , PC_Out_F  , PCPlus4_F , Instruction_D , PC_Out_D , PCPlus4_D);
input clk;
input [31:0] Instruction_F , PC_Out_F , PCPlus4_F;
output reg [31:0] Instruction_D , PC_Out_D , PCPlus4_D;
always @(posedge clk) begin
Instruction_D <= Instruction_F;
PC_Out_D <= PC_Out_F;
PCPlus4_D <= PCPlus4_F;
end
endmodule

module Pipe_E(clk , ReadData1_D , ReadData2_D , PC_Out_D , RD_D , imm_data_D , PCPlus4_D , MemWrite_D , ALUSrc_D , RegWrite_D , ImmSrc_D , ResultSrc_D , Operation_D , Branch_D , Jump_D , MemWrite_E , ALUSrc_E , RegWrite_E , ImmSrc_E , ResultSrc_E , Operation_E , Branch_E , Jump_E , ReadData1_E , ReadData2_E , PC_Out_E , RD_E , imm_data_E , PCPlus4_E);
input clk;
input [31:0] ReadData1_D , ReadData2_D , PC_Out_D , imm_data_D , PCPlus4_D;
input [4:0] RD_D;
input  MemWrite_D , ALUSrc_D , RegWrite_D;
input  [1:0] ImmSrc_D , ResultSrc_D;
input  [2:0] Operation_D;
input Branch_D , Jump_D;
output reg MemWrite_E , ALUSrc_E , RegWrite_E;
output reg [1:0] ImmSrc_E , ResultSrc_E;
output reg [2:0] Operation_E;
output reg Branch_E , Jump_E;
output reg [31:0] ReadData1_E , ReadData2_E , PC_Out_E , imm_data_E , PCPlus4_E;
output reg [4:0] RD_E;
always @(posedge clk) begin
MemWrite_E <= MemWrite_D;
ALUSrc_E <= ALUSrc_D;
RegWrite_E <= RegWrite_D; 
ImmSrc_E <= ImmSrc_D;
ResultSrc_E <= ResultSrc_D; 
Operation_E <= Operation_D; 
Branch_E <= Branch_D; 
Jump_E <= Jump_D;
ReadData1_E <= ReadData1_D;
ReadData2_E <= ReadData2_D;
PC_Out_E <= PC_Out_D;
imm_data_E <= imm_data_D;
PCPlus4_E <= PCPlus4_D;
RD_E <= RD_D;
end
endmodule

module Pipe_M(clk , RegWrite_E , ResultSrc_E , MemWrite_E , res_E , WriteData_E , RD_E , PCPlus4_E , RegWrite_M , ResultSrc_M , MemWrite_M , res_M , WriteData_M , RD_M , PCPlus4_M);
input clk;
input RegWrite_E , MemWrite_E;
input [1:0] ResultSrc_E;
input [31:0] res_E , WriteData_E , PCPlus4_E;
input [4:0] RD_E;
output reg RegWrite_M , MemWrite_M;
output reg [1:0] ResultSrc_M;
output reg [31:0] res_M , WriteData_M , PCPlus4_M;
output reg [4:0] RD_M;
always @(posedge clk) begin
RegWrite_M <= RegWrite_E;
ResultSrc_M <= ResultSrc_E;
MemWrite_M <= MemWrite_E; 
res_M <= res_E;
WriteData_M <= WriteData_E;
RD_M <= RD_E;
PCPlus4_M <= PCPlus4_E;
end
endmodule

module Pipe_W(clk , RegWrite_M , ResultSrc_M , res_M , Read_Data_M , RD_M , PCPlus4_M , RegWrite_W , ResultSrc_W , res_W , Read_Data_W , RD_W , PCPlus4_W );
input clk , RegWrite_M;
input [1:0] ResultSrc_M;
input [31:0] res_M , Read_Data_M , PCPlus4_M;
input [4:0] RD_M;
output reg RegWrite_W;
output reg [1:0] ResultSrc_W;
output reg [31:0] res_W , Read_Data_W , PCPlus4_W;
output reg [4:0] RD_W;
always @(posedge clk) begin
RegWrite_W <= RegWrite_M;
ResultSrc_W <= ResultSrc_M;
res_W <= res_M;
Read_Data_W <= Read_Data_M;
RD_W <= RD_M;
PCPlus4_W <= PCPlus4_M;
end
endmodule
