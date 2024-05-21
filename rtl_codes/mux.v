`timescale 1ns / 1ps

module mux #(parameter WIDTH = 32)(
    input [WIDTH-1:0] in0,in1,
    input sel,
    output reg [WIDTH-1:0]out
    );
    
   // assign out = sel ? in1 : in0;
    always @(in0 or in1 or sel)
    begin
        out = (sel == 1'b0)? in0: in1;
    end
endmodule
