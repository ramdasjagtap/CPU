`timescale 1ns / 1ps

// Data memorys unit
module DataMemory #(parameter  WIDTH = 32)(
    input clk,
    input MemRead,MemWrite,
    input [WIDTH-1:0] Address,
    input [WIDTH-1:0] WriteData,
    output  [WIDTH-1:0] ReadData
    );
    
    // memory 
    reg [WIDTH-1:0] memory[511:0];


  initial
    begin
      memory[0] = 32'h00000000;
      memory[1] = 32'h00000000;
      memory[2] = 32'h00000000;
      memory[3] = 32'h00000000;
      memory[4] = 32'h00000000;
      memory[5] = 32'h00000000;
      memory[6] = 32'h00000000;
      memory[7] = 32'h00000000;
      memory[8] = 32'h00000000;
      memory[9] = 32'h00000000;
      memory[10] = 32'h00000000;
      memory[11] = 32'h00000000;
      memory[12] = 32'h00000000;
      memory[13] = 32'h00000000;
      memory[14] = 32'h00000000;
      memory[15] = 32'h00000000;
      memory[16] = 32'h00000000;
      memory[17] = 32'h00000000;
      memory[18] = 32'h00000000;
      memory[19] = 32'h00000000;
      memory[20] = 32'h00000000;
      memory[21] = 32'h00000000;
      memory[22] = 32'h00000000;
      memory[23] = 32'h00000000;
      memory[24] = 32'h00000000;
      memory[25] = 32'h00000000;
      memory[26] = 32'h00000000;
      memory[27] = 32'h00000000;
      memory[28] = 32'h00000000;
      memory[29] = 32'h00000000;
      memory[30] = 32'h00000000;
    end

    always @(posedge clk)
     begin
       if(MemWrite == 1'b1)
          memory[Address] <= WriteData;
     end 
       
    assign ReadData = (MemRead == 1'b1)? memory[Address] : 32'd0;
       
endmodule
