# 5-Stage-RISC-V-Pipelined-Processor-With-Control
A 5-stage pipelined RISC-V processor designed and implemented in Verilog, featuring RTL diagrams, instruction memory handling, and detailed simulation results across all pipeline stages.

# Features
- Implements a 5-stage pipeline architecture: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB)
- Supports a range of RISC-V base instructions, including addi, slli, sw, bne, lw, and others
- Simulates instruction flow across pipeline stages, enabling step-by-step observation of data and control signal propagation
- Includes dedicated instruction and data memory modules for program execution and data handling
- Facilitates basic hazard analysis and instruction sequencing to preserve correct operation across pipeline stages

# Core Modules
- Control Unit (CU)
- ALU & ALU Control
- Register File
- Program Counter
- Immediate Generator
- Instruction & Data Memory
- Pipeline Registers

  # Pipeline Cycle Summary

Cycle 1: F1 | - | - | - | -
Cycle 2: F2 | D1 | - | - | -
Cycle 3: F3 | D2 | E1 | - | -
Cycle 4: F4 | D3 | E2 | M1 | -
Cycle 5: F5 | D4 | E3 | M2 | W1

# Simulation
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/3ed7ff04-8f1f-4611-aeb2-b38d7991dab8" />
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/e2175f5e-b0fe-486d-88e3-466fa9b0244a" /> <img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/3aa3e31d-0033-4346-ae55-e3cbe318494b" />


