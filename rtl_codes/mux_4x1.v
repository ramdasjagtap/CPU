`timescale 1ns / 1ps

// This is 3x1 mux 
module mux_4x1#(parameter WIDTH =32) (
        input [WIDTH-1:0] in0,in1,in2,
        input [1:0] sel,
        output reg [WIDTH-1:0] out
    );
    
    always @(*)
        begin
           case(sel)
           2'b00: out = in0;
           2'b01: out = in1;
           2'b10: out = in2;
           default: out = 'hx;
           endcase
        end
        
endmodule
