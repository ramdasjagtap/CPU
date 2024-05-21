`timescale 1ns / 1ps

// instruction decoding
module ALUcontrol(
        input [1:0] Aluop,
        input funct7,
        input [2:0] funct3,
        output reg [3:0] control
    );
    
    always @(*)
        begin
            case(Aluop)
            2'b00: control <= 4'b0010;
            2'b01: control <= 4'b0110;
            2'b10: case({funct7,funct3})
                        4'b0000: control <= 4'b0010;         // ADD;
                        4'b1000: control <= 4'b0110;         // SUB;
                        4'b0111: control <= 4'b0000;         // AND;
                        4'b0110: control <= 4'b0001;         // OR;
                        4'b0001: control <= 4'b0011;         // sll
                        4'b0010: control <= 4'b0100;          // slt
                        4'b0011: control <= 4'b0101;         //sltu
                        4'b0100: control <= 4'b0111;          //xor 
                        4'b0101: control <= 4'b1000;         // srl
                        4'b1101: control <= 4'b1010;         //sra
                        default : control <= 4'hx;
                            endcase
            2'b11: case({funct7,funct3})
                          4'b0000: control <= 4'b0010;           //addi
                          4'b0010: control <= 4'b0100;           //slti  
                          4'b0011: control <= 4'b0101;           //sltui  
                          4'b0100: control <= 4'b0111;           //xori  
                          4'b0110: control <= 4'b0001;           //ori  
                          4'b0111: control <= 4'b0000;           //andi  
                          4'b0001: control <= 4'b0011;           //slli  
                          4'b0101: control <= 4'b1000;           //srli  
                          4'b1101: control <= 4'b1010;           //srai  
                          default: control <= 4'hx;
                          endcase
            endcase
        end
endmodule
