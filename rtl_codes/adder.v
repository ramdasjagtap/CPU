`timescale 1ns/1ps

module adder #(parameter WIDTH = 32)(
	input [WIDTH-1:0] PC,
	output [WIDTH-1:0] PCPLUS4
);

	assign PCPLUS4 = PC + 1;
	
endmodule
