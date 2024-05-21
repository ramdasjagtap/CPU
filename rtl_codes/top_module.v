`timescale 1ns / 1ps

module top_module #(parameter WIDTH = 32 )(
    input clk,
    output [WIDTH-1:0] ReadData
    );
    
    // internal signals
    wire [WIDTH-1:0] PCNEXT;
    wire [WIDTH-1:0] PC,RD;
    wire Branch,Jump,MemWrite,MemRead,ALUSrc,RegWrite;
    wire [1:0] immsrc,Aluop,Resultsrc;
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
    PC #(WIDTH)  pccounter(
                .clk(clk),
                 .PCNEXT(PCNEXT),
                 .PC(PC)
                 );
                 
   // instruction memory module
    instructionmemory #(WIDTH) Imem(
                .PC(PC),
                .RD(RD)
                );
                
    //control unit module
    controlunit Cunit(
                 .instr(RD[6:0]),
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

    // regfile module
                        regfile #(WIDTH)  Rfile(
                                .clk(clk),
                                .RegWrite(RegWrite),
                                .r_reg1(RD[19:15]),
                                .r_reg2(RD[24:20]),
                                .w_reg(RD[11:7]),
                                .write_data(muxoutResult),
                                .r_data1(r_data1),
                                .r_data2(r_data2),
                                .result(result)
                        );
                        
        //ALU control module
        ALUcontrol ALUcunit(
                    .Aluop(Aluop),
                    .funct7(RD[30]),
                    .funct3(RD[14:12]),
                    .control(control)
           );
           
           // immediate data generation form instructions.
           ImmGen #(WIDTH) IGen(
                    .immsrc(immsrc),
                    .instr(RD),
                    .extimm(extimm)
           );
           
           // mux
           mux  #(WIDTH) MUX(
                        .in0(r_data2),
                        .in1(extimm),
                        .sel(ALUSrc),
                        .out(muxout)
           );
           
           //ALU module
           ALU  #(WIDTH) alu(
                    .controlsignal(control),
                    .A1(r_data1),
                    .A2(muxout),
                    .Y(ALUresult),
                    .zero(zero)
           );
           
           //data memory module
           DataMemory #(WIDTH) Dmem(
                        .clk(clk),
                        .MemRead(MemRead),
                        .MemWrite(MemWrite),
                        .Address(ALUresult),
                        .WriteData(r_data2),
                        .ReadData(ReadData)
           );
           
           // Adder Module instance
           adder  #(WIDTH) ADD(
                        .PC(PC),
                        .PCPLUS4(PCPLUS4)
           );
           
         // mux 4x1 
          mux_4x1 #(WIDTH) MUX4x1(
                    .in0(ALUresult),
                    .in1(ReadData),
                    .in2(PCPLUS4),
                    .sel(Resultsrc),
                    .out(muxoutResult)
          );
          
            // PC adder           
                   add #(WIDTH) ADD1(
                            .A1(PC),
                            .A2(extimm),
                            .Y(PCTarget)
                   );
          
          // Branch program counter
               mux #(WIDTH) Bpcmux(
                            .in0(PCPLUS4),
                            .in1(PCTarget),
                            .sel(Branch),
                            .out(PCNEXT)
               );
               
endmodule
