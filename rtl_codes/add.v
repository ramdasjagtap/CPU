`timescale 1ns / 1ps

module add #(parameter WIDTH = 32)(
            input [WIDTH-1:0] A1,A2,
            output [WIDTH-1:0] Y
    );
    
    assign Y = A1 + A2;
    
endmodule
