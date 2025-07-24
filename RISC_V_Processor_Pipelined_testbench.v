module RISC_V_Processor_Pipelined_tb();
    // Clock and Reset
    reg clk, rst;

    // Fetch Stage Signals
    wire [31:0] PC_Out_F, Instruction_F, PCPlus4_F;

    // Decode Stage Signals
    wire [31:0] PC_Out_D, Instruction_D, PCPlus4_D, ReadData1_D, ReadData2_D, imm_data_D;
    wire [1:0] ImmSrc_D, ResultSrc_D;
    wire RegWrite_D, ALUSrc_D, Branch_D, Jump_D, MemWrite_D;
    wire [2:0] Operation_D;

    // Execute Stage Signals
    wire [31:0] PC_Out_E, ReadData1_E, ReadData2_E, imm_data_E, PCPlus4_E, res_E, SrcB_E, PCTarget_E;
    wire [1:0] ResultSrc_E, ImmSrc_E;
    wire RegWrite_E, ALUSrc_E, Branch_E, Jump_E, MemWrite_E, Zero_E;
    wire [2:0] Operation_E;
    wire [4:0] RD_E;

    // Memory Stage Signals
    wire [31:0] res_M, WriteData_M, Read_Data_M, PCPlus4_M;
    wire [1:0] ResultSrc_M;
    wire RegWrite_M, MemWrite_M;
    wire [4:0] RD_M;

    // Writeback Stage Signals
    wire [31:0] res_W, Read_Data_W, PCPlus4_W, Result_W;
    wire [1:0] ResultSrc_W;
    wire RegWrite_W;
    wire [4:0] RD_W;

    // Instantiate the RISC-V Pipelined Processor
    RISC_V_Processor_Pipelined rv(clk , rst);


    // Fetch Stage Assignments
    assign PC_Out_F = rv.PC_Out_F;
    assign Instruction_F = rv.Instruction_F;
    assign PCPlus4_F = rv.PCPlus4_F;

    // Decode Stage Assignments
    assign PC_Out_D = rv.PC_Out_D;
    assign Instruction_D = rv.Instruction_D;
    assign PCPlus4_D = rv.PCPlus4_D;
    assign ReadData1_D = rv.ReadData1_D;
    assign ReadData2_D = rv.ReadData2_D;
    assign imm_data_D = rv.imm_data_D;
    assign ImmSrc_D = rv.ImmSrc_D;
    assign ResultSrc_D = rv.ResultSrc_D;
    assign RegWrite_D = rv.RegWrite_D;
    assign ALUSrc_D = rv.ALUSrc_D;
    assign Branch_D = rv.Branch_D;
    assign Jump_D = rv.Jump_D;
    assign MemWrite_D = rv.MemWrite_D;
    assign Operation_D = rv.Operation_D;

    // Execute Stage Assignments
    assign PC_Out_E = rv.PC_Out_E;
    assign ReadData1_E = rv.ReadData1_E;
    assign ReadData2_E = rv.ReadData2_E;
    assign imm_data_E = rv.imm_data_E;
    assign PCPlus4_E = rv.PCPlus4_E;
    assign res_E = rv.res_E;
    assign SrcB_E = rv.SrcB_E;
    assign PCTarget_E = rv.PCTarget_E;
    assign ResultSrc_E = rv.ResultSrc_E;
    assign ImmSrc_E = rv.ImmSrc_E;
    assign RegWrite_E = rv.RegWrite_E;
    assign ALUSrc_E = rv.ALUSrc_E;
    assign Branch_E = rv.Branch_E;
    assign Jump_E = rv.Jump_E;
    assign MemWrite_E = rv.MemWrite_E;
    assign Zero_E = rv.Zero_E;
    assign Operation_E = rv.Operation_E;
    assign RD_E = rv.Instruction_E;

    // Memory Stage Assignments
    assign res_M = rv.res_M;
    assign WriteData_M = rv.ReadData2_M;
    assign Read_Data_M = rv.Read_Data_M;
    assign PCPlus4_M = rv.PCPlus4_M;
    assign ResultSrc_M = rv.ResultSrc_M;
    assign RegWrite_M = rv.RegWrite_M;
    assign MemWrite_M = rv.MemWrite_M;
    assign RD_M = rv.Instruction_M;

    // Writeback Stage Assignments
    assign res_W = rv.res_W;
    assign Read_Data_W = rv.Read_Data_W;
    assign PCPlus4_W = rv.PCPlus4_W;
    assign Result_W = rv.Result_W;
    assign ResultSrc_W = rv.ResultSrc_W;
    assign RegWrite_W = rv.RegWrite_W;
    assign RD_W = rv.Instruction_W;

    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units

    // Initial block for setting up reset and monitoring signals
    initial begin
        // Initialize
        clk = 0;
        rst = 1;  // Start with reset enabled
        
        // Simulation control
        $display("Starting RISC-V Pipelined Processor Simulation");
        
        // Release reset
        #10 rst = 0; // Release reset after 10 time units
        
        // Monitor pipeline stage details
        $monitor("Time=%0t | F: PC=%h Instr=%h | D: PC=%h Instr=%h RD1=%h RD2=%h | E: PC=%h Res=%h SrcB=%h Op=%b | M: Res=%h WrData=%h RdData=%h | W: Res=%h RdData=%h Result=%h",
                 $time, 
                 PC_Out_F, Instruction_F, 
                 PC_Out_D, Instruction_D, ReadData1_D, ReadData2_D,
                 PC_Out_E, res_E, SrcB_E, Operation_E,
                 res_M, WriteData_M, Read_Data_M,
                 res_W, Read_Data_W, Result_W);
        
        // Run simulation
        #300 $finish; // End the simulation after 300 time units
    end
endmodule
