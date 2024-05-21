`timescale 1ns / 1ps

// ALU module
// ADD, SUB, AND, OR
module ALU #(parameter WIDTH =32)(
    input [3:0] controlsignal,
    input [WIDTH-1:0] A1,A2,
    output reg [WIDTH-1:0] Y,
    output  zero
    );
    
    always @(*)
        begin
          if(controlsignal == 4'b0000)
                            Y = A1 & A2;
          else if(controlsignal == 4'b0001)
                            Y = A1 | A2;
          else if(controlsignal == 4'b0010)
                            Y = A1 + A2;
          else if(controlsignal == 4'b0110)
                            Y = A1 -  A2;
          else if(controlsignal == 4'b0011)
                            Y = A1 <<  A2;
          else if(controlsignal == 4'b0100) begin
                            if((~A1+1) < (~A2+1))
                                begin
                                    Y = 1'b1;
                                end
                            else
                              begin
                                 Y  = 1'b0;
                              end
          end
          else if(controlsignal == 4'b0101) begin
                            if(A1 <  A2)
                                    Y = 1'b1;
                            else
                                    Y = 1'b0;
          end
          else if(controlsignal == 4'b0111)
                            Y = A1 ^ A2;
          else if(controlsignal == 4'b1000)
                            Y = A1 >> A2;
          else if(controlsignal == 4'b1010)
                             Y = A1 >>> A2;
          else 
                             Y = {WIDTH{1'bx}};
        end
    
    assign zero = (Y == 0)? 1'b1: 1'b0;
    
endmodule
