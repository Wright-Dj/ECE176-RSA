`timescale 1ns/1ns

module RSA_TB;
  wire [63:0] HEX;
  wire [31:0] data;
  reg [3:0] KEY;
  reg [17:0] SW;
  reg clk, reset;

  integer i;

  Top_Module M1 (
    .HEX,
    .data,
    .KEY, .SW,
    .clk, .reset
  );

  initial begin
    {KEY, SW} = 0;
    clk = 0;
    reset = 1;
    #100
    reset = 0;
    #100
    KEY = 1;
    for(i = 0; i < 256; i = i + 1) begin
      #100
      KEY = 2;
      SW = i;
      #100
      KEY = 4;
      #100
      KEY = 8;
      #100
      if(data != SW) begin
        $display("Error: data = %h, SW = %h", data, SW);
      end
    end
    $stop;
  end

  always #5 clk = ~clk;

endmodule

