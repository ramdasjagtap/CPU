`timescale 1ns / 1ps

// Control unit 
// This will support for R,I,S,SB type of RISC-v ISA
module controlunit(
    input [6:0] instr_i,
    output Branch,Jump,MemWrite,MemRead,ALUSrc,RegWrite,
    output [1:0]immsrc,Aluop,Resultsrc
    );
    
    reg [11:0] controls;
    assign  {Branch,Jump,MemWrite,MemRead,ALUSrc,RegWrite,immsrc,Aluop,Resultsrc} = controls ;
    
    always @(*)
        begin
            casex(instr_i)
                7'b0110011 : controls = 12'b0_0_0_xx_1_0_10_00_0;        // R-type instruction.
                7'b0000011 : controls = 12'b0_0_1_00_1_0_00_01_1;        // lw
                7'b0100011 : controls = 12'b0_0_1_01_0_1_00_xx_0;        // S-type instruction.
                7'b1100011 : controls = 12'b1_0_0_01_0_0_01_xx_0;        // SB -type instruction.
                7'b0010011: controls = 12'b0_0_1_00_1_0_11_00_0;       //  I - type
                7'b1100111: controls = 12'b0_1_1_11_1_x_00_10_0;      // jalr -type
                7'b1101111: controls = 12'b0_1_1_11_1_x_00_10_0;        // jal -type
                default: controls = 'hx;
            endcase
        end
        
endmodule
