`timescale 1ns/1ps;

//This is an instruction memory, which will recive the instruction form
//program counter and gives to next stage of pipelining.
module instructionmemory #(parameter WIDTH = 32)(
	input [WIDTH-1:0] PC,	// address of next instruction.
	output [WIDTH-1:0] RD
);

	reg [31:0] memory[0:511];
	
initial
    begin
    memory[0] = 32'h00000113;
    memory[1] = 32'h00000113; //addi x2 0(x0)
    memory[2] = 32'h00400093; //addi x1 4(x0)
    memory[3] = 32'h00100193; //addi x3 1(x0)
    memory[4] = 32'hFE20AF23; //sw x2 -2(x1)
    memory[5] = 32'hFE30AFA3; //sw x3 -1(x1)
    memory[6] = 32'h00310233; //add x4 x2 x3
    memory[7] = 32'h0040A023; //sw x4 0 (x1)
    memory[8] = 32'h00108093; //addi x1 1 (x1) 
    memory[9] = 32'h00018113; //addi x2 0 (x3)
    memory[10] = 32'h00020193; //addi x3 0 (x4)
    memory[11] = 32'h00310233; //add x4 x2 x3
    memory[12] = 32'h0040A023; //sw x4 0 (x1)
    memory[13] = 32'h00108093; //addi x1 1 (x1) 
    memory[14] = 32'h00018113; //addi x2 0 (x3)
    memory[15] = 32'h00020193; //addi x3 0 (x4)
    memory[16] = 32'h00310233; //add x4 x2 (x3)
    memory[17] = 32'h0040A023; //sw x4 0(x1)
    memory[18] = 32'h00108093; //addi x1 1 x1 
    memory[19] = 32'h00018113; //addi x2 0 x3
    memory[20] = 32'h00020193; //addi x3 0 x4
    memory[21] = 32'h00310233; //add x4 x2 x3
    memory[22] = 32'h0040A023; //sw x4 0 x1
    memory[23] = 32'h00108093; //addi x1 1 x1 
    memory[24] = 32'h00018113; //addi x2 0 x3
    memory[25] = 32'h00020193; //addi x3 0 x4
    memory[26] = 32'h00310233; //add x4 x2 x3
    memory[27] = 32'h0040A023; //sw x4 0 x1
    memory[28] = 32'h00108093; //addi x1 1 x1 
    memory[29] = 32'h00018113; //addi x2 0 x3
    memory[30] = 32'h00020193; //addi x3 0 x4
    memory[31] = 32'h00310233; //add x4 x2 x3
    memory[32] = 32'h0040A023; //sw x4 0 x1
    memory[33] = 32'h00108093; //addi x1 1 x1 
    memory[34] = 32'h00018113; //addi x2 0 x3
    memory[35] = 32'h00020193; //addi x3 0 x4
    memory[36] = 32'h00310233; //add x4 x2 x3
    memory[37] = 32'h0040A023; //sw x4 0 x1
    memory[38] = 32'h00108093; //addi x1 1 x1 
    memory[39] = 32'h00018113; //addi x2 0 x3
    memory[40] = 32'h00020193; //addi x3 0 x4
    memory[41] = 32'h00310233; //add x4 x2 x3
    memory[42] = 32'h0040A023; //sw x4 0 x1
    memory[43] = 32'h00108093; //addi x1 1 x1 
    memory[44] = 32'h00018113; //addi x2 0 x3
    memory[45] = 32'h00020193; //addi x3 0 x4
    memory[46] = 32'h00310233; //add x4 x2 x3
    memory[47] = 32'h0040A023; //sw x4 0 x1
    memory[48] = 32'h00108093; //addi x1 1 x1 
    memory[49] = 32'h00018113; //addi x2 0 x3
    memory[50] = 32'h00020193; //addi x3 0 x4
    memory[51] = 32'h00310233; //add x4 x2 x3
    memory[52] = 32'h0040A023; //sw x4 0 x1
    memory[53] = 32'h00108093; //addi x1 1 x1 
    memory[54] = 32'h00018113; //addi x2 0 x3
    memory[55] = 32'h00020193; //addi x3 0 x4
    memory[56] = 32'h00310233; //add x4 x2 x3
    memory[57] = 32'h0040A023; //sw x4 0 x1
    memory[58] = 32'h00108093; //addi x1 1 x1 
    memory[59] = 32'h00018113; //addi x2 0 x3
    memory[60] = 32'h00020193; //addi x3 0 x4
    
    memory[61] = 32'h00310233; //add x4 x2 x3
    memory[62] = 32'h0040A023; //sw x4 0 x1
    memory[63] = 32'h00108093; //addi x1 1 x1 
    memory[64] = 32'h00018113; //addi x2 0 x3
    memory[65] = 32'h00020193; //addi x3 0 x4
    memory[66] = 32'h00310233; //add x4 x2 x3
    memory[67] = 32'h0040A023; //sw x4 0 x1
    memory[68] = 32'h00108093; //addi x1 1 x1 
    memory[69] = 32'h00018113; //addi x2 0 x3
    memory[70] = 32'h00020193; //addi x3 0 x4
    memory[71] = 32'h00310233; //add x4 x2 x3
    memory[72] = 32'h0040A023; //sw x4 0 x1
    memory[73] = 32'h00108093; //addi x1 1 x1 
    memory[74] = 32'h00018113; //addi x2 0 x3
    memory[75] = 32'h00020193; //addi x3 0 x4
    memory[76] = 32'h00310233; //add x4 x2 x3
    memory[77] = 32'h0040A023; //sw x4 0 x1
    memory[78] = 32'h00108093; //addi x1 1 x1 
    memory[79] = 32'h00018113; //addi x2 0 x3
    memory[80] = 32'h00020193; //addi x3 0 x4
    memory[81] = 32'h00310233; //add x4 x2 x3
    memory[82] = 32'h0040A023; //sw x4 0 x1
    memory[83] = 32'h00108093; //addi x1 1 x1 
    memory[84] = 32'h00018113; //addi x2 0 x3
    memory[85] = 32'h00020193; //addi x3 0 x4
    
    memory[86] = 32'h00008093; //addi x1 0 x1
    
    
    //loading
    memory[87] = 32'h00202303; //lw x7 2( x0)
    memory[88] = 32'h00302303; //lw x7 3( x0)
    memory[89] = 32'hFF00A483; //lw x7 -16( x1)
    memory[90] = 32'hFF10A483; //lw x7 -15( x1)
    memory[91] = 32'hFF20A483; //lw x7 -14( x1)
    memory[92] = 32'hFF30A483; //lw x7 -13( x1)
    memory[93] = 32'hFF40A483; //lw x7 -12( x1)
    memory[94] = 32'hFF50A483; //lw x7 -11( x1)
    memory[95] = 32'hFF60A483; //lw x7 -10( x1)
    memory[96] = 32'hFF70A483; //lw x7 -9( x1)
    memory[97] = 32'hFF80A483; //lw x7 -8( x1)
    memory[98] = 32'hFF90A483; //lw x7 -7( x1)
    memory[99] = 32'hFFA0A483; //lw x7 -6( x1)
    memory[100] = 32'hFFB0A483; //lw x7 -5( x1)
    memory[101] = 32'hFFC0A483; //lw x7 -4( x1)
    memory[102] = 32'hFFD0A483; //lw x7 -3( x1)
    memory[103] = 32'hFFE0A483; //lw x7 -2( x1)
    memory[104] = 32'hFFF0A483; //lw x7 -1( x1)
    
    memory[105] = 32'hFE4187E3; //beq x3 x4 mem1[87]
end

	assign RD = memory[PC];
endmodule
