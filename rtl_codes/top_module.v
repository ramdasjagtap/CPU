`timescale 1ns / 1ps

module top_module #(parameter WIDTH =32 )(
    input clk,
    output [WIDTH-1:0] ReadData
    );
    
    // internal signals
    wire [WIDTH-1:0] PCNEXT;
    wire [WIDTH-1:0] PC,RD;
    wire Branch,Jump,MemWrite,MemRead,ALUSrc,RegWrite;
    wire [1:0] immsrc,Aluop,Resultsrc;
    wire [WIDTH-1:0] write_data;  // result of mux 4x1
    wire [WIDTH-1:0] r_data1,r_data2,result;
    wire [3:0] control;
    wire [WIDTH-1:0]extimm;
    wire [WIDTH-1:0]ALUresult;
    wire zero;
    wire [WIDTH-1:0] muxout;
    wire [WIDTH-1:0] PCPLUS4;
    wire [WIDTH-1:0] PCTarget;
    wire [WIDTH-1:0] muxoutResult;
    
    //program counter module
    PC pccounter(
                .clk(clk),
                 .reset(reset),
                 .PCNEXT(PCNEXT),
                 .PC(PC)
                 );
                 
   // instruction memory module
    instructionmemory Imem(
                .PC(PC),
                .RD(RD)
                );
                
    //control unit module
    controlunit Cunit(
                 .instr_i(RD[6:0]),
                 .Branch(Branch),
                 .Jump(Jump),
                 .MemWrite(MemWrite),
                 .MemRead(MemRead),
                 .ALUSrc(ALUSrc),
                 .RegWrite(RegWrite),
                 .immsrc(immsrc),
                 .Aluop(Aluop),
                 .Resultsrc(Resultsrc)
                 );

        //ALU control module
        ALUcontrol ALUcunit(
                    .Aluop(Aluop),
                    .funct7(RD[30]),
                    .funct3(RD[14:12]),
                    .control(control)
           );
        
           // regfile module
           regfile Rfile(
                   .clk(clk),
                   .RegWrite(RegWrite),
                   . r_reg1(RD[19:15]),
                   .r_reg2(RD[24:20]),
                   .w_reg(RD[11:7]),
                   .write_data(write_data),
                   .r_data1(r_data1),
                   .r_data2(r_data2),
                   .result(result)
           );
           
           // immediate data generation form instructions.
           ImmGen IGen(
                    .immsrc(immsrc),
                    .instr(RD),
                    .extimm(extimm)
           );
           
           // mux
           mux MUX(
                        .in0(r_data1),
                        .in1(extimm),
                        .sel(ALUsrc),
                        .out(muxout)
           );
           
           //ALU module
           ALU  alu(
                    .controlsignal(),
                    .A1(r_data1),
                    .A2(muxout),
                    .Y(ALUresult),
                    .zero(zero)
           );
           
           //data memory module
           DataMemory Dmem(
                        .clk(clk),
                        .MemRead(MemRead),
                        .MemWrite(MemWrite),
                        .Address(ALUresult),
                        .WriteData(r_data2),
                        .ReadData(ReadData)
           );
           
           // Adder Module instance
           adder ADD(
                        .PC(PC),
                        .PCPLUS4(PCPLUS4)
           );
        
        // PC adder           
           add ADD1(
                    .A1(PC),
                    .A2(PCPLUS4),
                    .Y(PCTarget)
           );
           
         // mux 4x1 
          mux_4x1 MUX4x1(
                    .in0(ALUresult),
                    .in1(ReadData),
                    .in2(PCPLUS4),
                    .sel(Resultsrc),
                    .out(muxoutResult)
          );
          
          // Branch program counter
               mux Bpcmux(
                            .in0(PCPLUS4),
                            .in1(PCTarget),
                            .sel(Branch),
                            .out(PCNEXT)
               );
endmodule
