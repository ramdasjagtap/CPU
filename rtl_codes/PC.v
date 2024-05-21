`timescale 1ns/1ps

module PC #(parameter WIDTH = 32)(
	input clk,
	input [WIDTH-1:0]PCNEXT,
	output reg [WIDTH-1:0]PC
);
	always @(posedge clk)
	begin
			PC <= PCNEXT;
	end
	
	initial
		begin
			PC = 32'b0;
		end
    
endmodule
