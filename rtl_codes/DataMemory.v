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
    reg [WIDTH-1:0] memory[0:511];
    // temp variable
    reg [WIDTH-1:0] temp;
    always @(posedge clk)
     begin
       if(MemWrite)
          memory[Address] <= WriteData;
     end
    
    always @(posedge clk)
       begin
            if(MemRead)
               temp <= memory[Address];
       end
       
       assign ReadData = (MemRead)? temp: 'hz;
       
endmodule
