`timescale 1ns / 1ps

// Extracting Immediate data from ISA
module ImmGen #(parameter  WIDTH = 32)(
    input [1:0] immsrc,
    input [WIDTH-1:0] instr,
    output reg [WIDTH-1:0] extimm
    );
   
    // Instruction format used are -> R, I,S,B,U.
    always @(*)
        begin
            case(immsrc)
                2'b00: extimm = {{20{instr[31]}},instr[31:20]};         // I type.
                2'b01:extimm = {{21{instr[31]}},instr[30:25],instr[11:7]};      //S type
                2'b10:extimm = {{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};      // B type
                2'b11:extimm = {{12{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};      // U type
                default: extimm = 32'hx;
            endcase 
        end
endmodule
