`timescale 1ns/1ps

module regfile #(parameter WIDTH = 32)(
	input clk,
	input RegWrite,
	input [4:0] r_reg1,r_reg2,w_reg,
	input [WIDTH-1:0] write_data,
	output  [WIDTH-1:0] r_data1,r_data2,result
);

	reg [WIDTH-1:0] REGFILE [0:WIDTH-1];

	initial
	 begin
		 REGFILE[0] = 32'h00000000;
		 REGFILE[1] = 32'h00000001;
		 REGFILE[2] = 32'h00000002;
		 REGFILE[3] = 32'h00000007;
		 REGFILE[4] = 32'h00000008; 
		 REGFILE[5] = 32'h00000005;
		 REGFILE[6] = 32'h00000006;
		 REGFILE[7] = 32'h00000007;
		 REGFILE[8] = 32'h00000008;
		 REGFILE[9] = 32'h00000009;
		 REGFILE[10] = 32'h00000010;
	 end

	always @(posedge clk)
	 begin
		if(RegWrite)
			REGFILE[w_reg] <= write_data;
	 end

	assign r_data1 = (r_reg1 != 0)? REGFILE[r_reg1] : 0;
	assign r_data2 = (r_reg2 != 0)? REGFILE[r_reg2] : 0;
	assign result = REGFILE[w_reg];
	
endmodule
