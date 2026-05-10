`timescale 1ns / 1ps
module key_synchroniser (
    input logic clk,
    input logic [3:0] key_n,  // active -low , asynchronous
    output logic [3:0] key_sync  // active -high , synchronised
);

  logic [3:0] ff1 = 4'b0000;
  initial key_sync = 4'b0000;

  always_ff @(posedge clk) begin
    ff1 <= ~key_n;
    key_sync <= ff1;
  end

endmodule
