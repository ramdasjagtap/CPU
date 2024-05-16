`timescale 1ns/1ps;

module PC #(parameter WIDTH = 32)(
	input clk,
	input reset,
	input [WIDTH-1:0]PCNEXT,
	output reg [WIDTH-1:0]PC
);
	always @(posedge clk or posedge reset)
	begin
		if(reset)
		begin
			PC <= 'h0;
		end
		else begin
			PC <= PCNEXT;
		end
	end
endmodule